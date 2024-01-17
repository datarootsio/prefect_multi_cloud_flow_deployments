#!/usr/bin/env bash
#set -x

# Creates the relevant storage account to store terraform state locally

RESOURCE_GROUP_NAME="test-rg"
STORAGE_ACCOUNT_NAME="manageprefectworkflow"
REGION="francecentral"

# Create Storage Account
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l $REGION --sku Standard_LRS

# Create Storage Account blob
az storage container create  --name tfstate --account-name $STORAGE_ACCOUNT_NAME
