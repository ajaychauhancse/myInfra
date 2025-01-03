resource "oci_core_vcn" "my_vcn" {
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_name
  cidr_block     = var.cidr_block
}

