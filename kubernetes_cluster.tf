resource "oci_containerengine_cluster" "k8s_cluster" {
  compartment_id = var.compartment_ocid
  kubernetes_version = "v1.28.2"
  name = "free_k8s_cluster"
  vcn_id = oci_core_vcn.my_vcn.id
  endpoint_config {
    is_public_ip_enabled = true
    subnet_id = oci_core_subnet.public_subnet.id
  }

  options {
    add_ons {
      is_kubernetes_dashboard_enabled = false 
      is_tiller_enabled = false 
    }
    kubernetes_network_config {
      pods_cidr = "10.10.0.0/16"
      services_cidr = "10.11.0.0/16"
    }
    service_lb_subnet_ids = [oci_core_subnet.public_subnet.id]
  }
}


resource "oci_containerengine_node_pool" "k8s_node_pool" {
  cluster_id         = oci_containerengine_cluster.k8s_cluster.id
  compartment_id     = var.compartment_ocid
  kubernetes_version = "v1.28.2"
  name               = "free-k8s-node-pool"
  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
      subnet_id           = oci_core_subnet.private_subnet.id
    }
    # placement_configs {
    #   availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
    #   subnet_id           = oci_core_subnet.vcn_private_subnet.id
    # }
    # placement_configs {
    #   availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
    #   subnet_id           = oci_core_subnet.vcn_private_subnet.id
    # }
    size = 2


  }
  node_shape = "VM.Standard.A1.Flex"

  node_shape_config {
    memory_in_gbs = 6
    ocpus         = 1
  }

  node_source_details {
    image_id    = "ocid1.image.oc1.phx.aaaaaaaaug4bu37fn6d6ezz7qfvfhqk4bch7gfujrmpyhofwergono3t7waa"
    source_type = "image"
  }

  initial_node_labels {
    key   = "name"
    value = "free-k8s-cluster"
  }

  ssh_public_key = file("compute-key/id_rsa_key_com.pub")
}