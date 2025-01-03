[DEFAULT]
user=ocid1.user.oc1..aaaaaaaaq2gvnwi3cw3nttgpxqvgysfnrvxxjrl6vnjecrevkpgt4t2cqybq
fingerprint=a2:36:12:25:c8:60:11:c7:0d:20:e3:27:d4:34:82:b6
tenancy=ocid1.tenancy.oc1..aaaaaaaattfv3wexglwupuljgdms2ynsslw456nkyaseebxygpoo75hzpo4q
region=us-phoenix-1
key_file=<path to your private keyfile> # TODO

export TF_VAR_private_key=`cat ~/myPOC/tfadmin_private.pem`
terraform plan -var-file="env/dev.tfvars"
terraform apply -var-file="env/dev.tfvars"

eval "$(ssh-agent -s)"
ssh-add /Users/ajayc/myPOC/myinfra/compute-key/id_rsa_key_com
ssh-add /Users/ajayc/myPOC/ssh_tunnel/id_rsa

myCompute(Pub) add priv-key ==>myComputePriv(Priv)
			   ==>myComputePriv1(Priv)
			   


curl ifconfig.me
