#!/bin/sh

# Provision AWS infrastructure

set -e

echo " "
echo "*** Building AWS Consul infrastructure ***"

cd ../tf_env_aws

terraform init \
  -backend-config="bucket=tf-remote-state-gstafford" \
  -backend-config="key=terraform_consul.tfstate" \
  -backend-config="region=us-east-1" \
  -backend=true -force-copy -get=true -input=false -no-color

terraform plan -no-color
terraform apply -no-color

echo " "
echo "*** Building AWS Consul infrastructure complete ***"
