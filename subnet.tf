resource "oci_core_subnet" "public_subnet" {
  compartment_id       = var.compartment_ocid
  vcn_id               = oci_core_vcn.my_vcn.id
  cidr_block           = "192.168.1.0/24"
  display_name         = "${var.vcn_name}_public_subnet"
  prohibit_public_ip_on_vnic = false
  security_list_ids    = [oci_core_security_list.web_server.id]
  route_table_id = oci_core_route_table.test_route_table.id
  #dns_label            = "pubsubnet"
}

resource "oci_core_subnet" "private_subnet" {
  compartment_id       = var.compartment_ocid
  vcn_id               = oci_core_vcn.my_vcn.id
  cidr_block           = "192.168.2.0/24"
  display_name         = "${var.vcn_name}_private_subnet"
  prohibit_public_ip_on_vnic = true
  security_list_ids    = [oci_core_security_list.priv_server.id]
  route_table_id = oci_core_route_table.priv_route_table.id
  #dns_label            = "pubsubnet"
}
