#!/bin/bash

wget "https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip"
 
unzip packer_1.7.0_linux_amd64.zip
./packer_1.7.0_linux_amd64/packer build build.json
