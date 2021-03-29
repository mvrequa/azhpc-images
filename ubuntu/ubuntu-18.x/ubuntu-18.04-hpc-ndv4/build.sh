#!/bin/bash

#wget "https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip"


end=`date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ'`
SAS_TOKEN=$(/usr/bin/az storage container generate-sas \
    --account-name "requawestus2" \
    --name "stor" \
    --permissions acdlrw \
    --auth-mode login \
    --as-user \
    --expiry $end)

/usr/bin/az storage blob download \
    --account-name "requawestus2" \
    --container-name "stor" \
    --name packer_1.7.0_linux_amd64.zip \
    --file packer_1.7.0_linux_amd64.zip \
    --sas-token $SAS_TOKEN
 
unzip packer_1.7.0_linux_amd64.zip
ls -lt
pwd
./packer build build.json
