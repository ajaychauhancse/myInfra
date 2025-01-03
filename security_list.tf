resource "oci_core_security_list" "web_server" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.my_vcn.id
  display_name   = "web-server-security-list"

  ingress_security_rules {
    protocol = "6" # TCP protocol
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }


  ingress_security_rules {
    protocol = "all" # TCP protocol
    source   = "192.168.0.0/16"
  }
  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = "6"
    tcp_options {
      min = 6443
      max = 6443
    }
  }
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "priv_server" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.my_vcn.id
  display_name   = "priv-server-security-list"

  ingress_security_rules {
    protocol = "6" # TCP protocol
    source   = "192.168.0.0/16"

    tcp_options {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    protocol = "all" # TCP protocol
    source   = "192.168.0.0/16"
  }
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}
