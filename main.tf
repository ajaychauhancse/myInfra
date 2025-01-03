terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 6.0" # Use the desired version of the OCI provider
    }
  }

  required_version = ">= 1.5.0" # Ensure your Terraform version is compatible
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key      = var.private_key
  region           = var.region
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}
data "oci_core_services" "test_services" {
}

data "oci_core_images" "my_images" {
  compartment_id = var.compartment_ocid
  operating_system = "Oracle Linux" 
  operating_system_version = "8"  
  shape = "VM.Standard.E2.1.Micro"
}

resource "oci_objectstorage_bucket" "mybucket" {
  compartment_id = var.compartment_ocid
  name = "myociajay2024_test1"
  namespace = var.namespace  
}
