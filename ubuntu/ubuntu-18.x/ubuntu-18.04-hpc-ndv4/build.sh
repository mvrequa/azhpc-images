#!/bin/bash
set -x
#wget "https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip"


#end=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
#/usr/bin/az storage container generate-sas \
#    --account-name "requawestus2" \
#    --name "stor" \
#    --permissions acdlrw \
#    --auth-mode login \
#    --as-user \
#    --expiry $end
#
#/usr/bin/az storage blob download \
#    --account-name "requawestus2" \
#    --container-name "stor" \
#    --name packer_1.7.0_linux_amd64.zip \
#    --file packer_1.7.0_linux_amd64.zip \
#    --sas-token $SAS_TOKEN


wget "https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip"
unzip packer_1.7.0_linux_amd64.zip
ls -lt
pwd

SUB_ID=`az account show --query id | tr -d '"'`
./packer build -var "subscription_id=$SUB_ID" \
  -var "client_secret=$servicePrincipalKey" \
  -var "tenant_id=$tenantId" \
  -var "client_id=$servicePrincipalId" \
  build.json
