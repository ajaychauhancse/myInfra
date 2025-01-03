resource "oci_core_service_gateway" "test_service_gateway" {
  compartment_id = var.compartment_ocid
  services {
    service_id = data.oci_core_services.test_services.services[0].id
  }
  vcn_id = oci_core_vcn.my_vcn.id
}