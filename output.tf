# Output the "list" of all availability domains.
output "all-availability-domains-in-your-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}
output "vcn_id" {
  value = oci_core_vcn.my_vcn.id
}

output "internet_gateway_id" {
  value = oci_core_internet_gateway.igw.id
}

output "myComputePublicIP" {
  value = oci_core_instance.myCompute.public_ip
}

output "myComputePrivPrivIP" {
  value = oci_core_instance.myComputePriv.private_ip
}

output "myComputePriv1PrivIP" {
  value = oci_core_instance.myComputePriv1.private_ip
}

output "k8s-cluster-id" {
  value = oci_containerengine_cluster.k8s_cluster.id
}
