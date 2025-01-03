

resource "oci_core_instance" "myCompute" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
    compartment_id = var.compartment_ocid
    shape = "VM.Standard.A1.Flex"
    source_details {
        source_id = "ocid1.image.oc1.phx.aaaaaaaaug4bu37fn6d6ezz7qfvfhqk4bch7gfujrmpyhofwergono3t7waa"
        source_type = "image"
    }

    shape_config {
        ocpus         = 1       # Number of OCPUs
        memory_in_gbs = 6      # Amount of memory in GB
    }


    # Optional
    display_name = "myCompute"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.public_subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("compute-key/id_rsa_key_com.pub")
        user_data = base64encode(<<EOT
#!/bin/bash
sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo chmod 777 /usr/share/nginx/html/*
sudo echo "<h1>Welcome to Public HTTP Server</h1>" > /usr/share/nginx/html/index.html
sudo systemctl reload nginx
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
EOT
        )
    }
    preserve_boot_volume = false
}



resource "oci_core_instance" "myComputePriv" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
    compartment_id = var.compartment_ocid
    shape = "VM.Standard.A1.Flex"
    source_details {
        source_id = "ocid1.image.oc1.phx.aaaaaaaaug4bu37fn6d6ezz7qfvfhqk4bch7gfujrmpyhofwergono3t7waa"
        source_type = "image"
    }

    shape_config {
        ocpus         = 1       # Number of OCPUs
        memory_in_gbs = 6      # Amount of memory in GB
    }


    # Optional
    display_name = "myComputePriv"
    create_vnic_details {
        assign_public_ip = false
        subnet_id = oci_core_subnet.private_subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("compute-key/id_rsa_key_com.pub")
        user_data = base64encode(<<EOT
#!/bin/bash
sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo chmod 777 /usr/share/nginx/html/*
sudo echo "<h1>Welcome to Nginx Private HTTP Server1</h1>" > /usr/share/nginx/html/index.html
sudo systemctl reload nginx
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
EOT
        )
    }
    preserve_boot_volume = false
}

resource "oci_core_instance" "myComputePriv1" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
    compartment_id = var.compartment_ocid
    shape = "VM.Standard.A1.Flex"
    source_details {
        source_id = "ocid1.image.oc1.phx.aaaaaaaaug4bu37fn6d6ezz7qfvfhqk4bch7gfujrmpyhofwergono3t7waa"
        source_type = "image"
    }

    shape_config {
        ocpus         = 1       # Number of OCPUs
        memory_in_gbs = 6      # Amount of memory in GB
    }


    # Optional
    display_name = "myComputePriv1"
    create_vnic_details {
        assign_public_ip = false
        subnet_id = oci_core_subnet.private_subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("compute-key/id_rsa_key_com.pub")
        user_data = base64encode(<<EOT
#!/bin/bash
sudo yum install epel-release -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo chmod 777 /usr/share/nginx/html/*
sudo echo "<h1>Welcome to Nginx Private HTTP Server2</h1>" > /usr/share/nginx/html/index.html
sudo systemctl reload nginx
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
EOT
        )
    }
    preserve_boot_volume = false
}
