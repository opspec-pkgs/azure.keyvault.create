#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for exiting key vault"
if [ "$(az keyvault show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found exiting key vault"
else
    createCmd='az keyvault create'
    createCmd=$(printf "%s --location %s" "$createCmd" "$location")
    createCmd=$(printf "%s --enabled-for-deployment %s" "$createCmd" "$enabledForDeployment")
    createCmd=$(printf "%s --enabled-for-disk-encryption %s" "$createCmd" "$enabledForDiskEncryption")
    createCmd=$(printf "%s --enabled-for-template-deployment %s" "$createCmd" "$enabledForTemplateDeployment")
    createCmd=$(printf "%s --no-self-perms %s" "$createCmd" "$noSelfPerms")
    createCmd=$(printf "%s --sku %s" "$createCmd" "$sku")
    createCmd=$(printf "%s --name %s" "$createCmd" "$name")
    createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")

    # handle opts
    if [ "$tags" != " " ]; then
        createCmd=$(printf "%s --tags %s" "$createCmd" "$tags")
    fi

    echo "creating key vault"
    eval "$createCmd"
fi
