#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$azureUsername" -p "$azurePassword" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for exiting key vault"
if [ "$(az keyvault show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found exiting key vault"
else
  echo "creating key vault"
  az keyvault create \
    --location "$location" \
    --enabled-for-deployment "$enabledForDeployment" \
    --enabled-for-disk-encryption "$enabledForDiskEncryption" \
    --enabled-for-template-deployment "$enabledForTemplateDeployment" \
    --no-self-perms "$noSelfPerms" \
    --sku "$sku" \
    --name "$name" \
    --resource-group "$resourceGroup"
fi
