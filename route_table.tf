resource "oci_core_route_table" "test_route_table" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.my_vcn.id
    display_name = "test_route_table"

    route_rules {
        #Required
        network_entity_id = oci_core_internet_gateway.igw.id

        #Optional
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }
}

resource "oci_core_route_table" "priv_route_table" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.my_vcn.id
    display_name = "priv_route_table"

    route_rules {
        #Required
        network_entity_id = oci_core_nat_gateway.priv_nat_gateway.id
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }

  route_rules {
    # Route for Oracle Services via Service Gateway
    destination        = "all-phx-services-in-oracle-services-network"
    destination_type   = "SERVICE_CIDR_BLOCK"
    network_entity_id  = oci_core_service_gateway.test_service_gateway.id
  }

}