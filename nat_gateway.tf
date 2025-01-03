resource "oci_core_nat_gateway" "priv_nat_gateway" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.my_vcn.id

    #Optional
    display_name = "priv_nat_gw"
}