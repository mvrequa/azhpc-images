#!/bin/bash
set -ex
cd /tmp
# set properties
source ./set_properties.sh

./setup_00.sh 

./setup_01.sh 

./setup_02.sh 

./setup_03.sh 
