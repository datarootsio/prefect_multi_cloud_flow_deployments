#!/usr/bin/env bash
#set -x

# Creates service principal with contributor role to your subscription

SUBSCRIPTION_ID=$(az account show --query id -o tsv)
SP_NAME="prefectWorkflows"
az ad sp create-for-rbac --name $SP_NAME --role "contributor" --scopes "/subscriptions/$SUBSCRIPTION_ID" --sdk-auth  --output json
