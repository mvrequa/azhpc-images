#!/bin/bash

#wget "https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip"

az storage blob download --account-name "requawestus2" \
    --container-name "stor" \
    --name \ packer_1.7.0_linux_amd64.zip
    --file packer_1.7.0_linux_amd64.zip
 
unzip packer_1.7.0_linux_amd64.zip
ls -lt
pwd
./packer build build.json
