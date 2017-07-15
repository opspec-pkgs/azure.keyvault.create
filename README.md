# Problem statement
creates an azure keyvault (if doesn't already exist)

# Example usage

> note: in examples, VERSION represents a version of the azure.keyvault.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.keyvault.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.keyvault.create#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.keyvault.create#VERSION }
    inputs: 
      subscriptionId:
      loginId:
      loginSecret:
      name:
      resourceGroup:
      # begin optional args
      location:
      enabledForDeployment:
      enabledForDiskEncryption:
      enabledForTemplateDeployment:
      noSelfPerms:
      sku:
      loginTenantId:
      loginType:
      tags:
      # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.keyvault.create/issues)
