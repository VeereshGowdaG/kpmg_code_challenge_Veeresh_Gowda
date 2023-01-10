#!/bin/bash 
#Login to azure portal
az Login -o none

#get the storage account details and store it into json file
[ -e meta_data_azure_resource.json ] && rm meta_data_azure_resource.json

touch meta_data_azure_resource.json

az storage account show -g cloud-shell-storage-centralindia -n csg100320020ea571a3 -o json > meta_data_azure_resource.json
echo -e "\n"

#Running data-key.py file to display the parsed json key value pairs
python3 data-key.py

