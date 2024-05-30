[![Build Status](https://github.com/opspec-pkgs/azure.aks.create/workflows/build/badge.svg?branch=main)](https://github.com/opspec-pkgs/azure.aks.create/actions?query=workflow%3Abuild+branch%3Amain)

<img src="icon.svg" alt="icon" height="100px">

# Problem statement

creates a kubernetes cluster in azure kubernetes service (if it doesn't exist)

# Example usage

## Visualize

```shell
opctl ui github.com/opspec-pkgs/azure.aks.create#1.1.0
```

## Run

```
opctl run github.com/opspec-pkgs/azure.aks.create#1.1.0
```

## Compose

```yaml
op:
  ref: github.com/opspec-pkgs/azure.aks.create#1.1.0
  inputs:
    loginId:  # 👈 required; provide a value
    loginSecret:  # 👈 required; provide a value
    name:  # 👈 required; provide a value
    resourceGroup:  # 👈 required; provide a value
    sshKeyValue:  # 👈 required; provide a value
    subscriptionId:  # 👈 required; provide a value
  ## uncomment to override defaults
  #   adminUsername: "azureuser"
  #   clientSecret: " "
  #   dnsPrefix: " "
  #   kubernetesVersion: "1.7.7"
  #   location: "eastus"
  #   loginTenantId: " "
  #   loginType: "user"
  #   nodeCount: 3
  #   nodeOSDiskSize: 30
  #   nodeVmSize: "Standard_D1_v2"
  #   servicePrincipal: " "
```

# Support

join us on
[![Slack](https://img.shields.io/badge/slack-opctl-E01563.svg)](https://join.slack.com/t/opctl/shared_invite/zt-51zodvjn-Ul_UXfkhqYLWZPQTvNPp5w)
or
[open an issue](https://github.com/opspec-pkgs/azure.aks.create/issues)

# Releases

releases are versioned according to
[![semver 2.0.0](https://img.shields.io/badge/semver-2.0.0-brightgreen.svg)](http://semver.org/spec/v2.0.0.html)
and [tagged](https://git-scm.com/book/en/v2/Git-Basics-Tagging); see
[CHANGELOG.md](CHANGELOG.md) for release notes

# Contributing

see
[project/CONTRIBUTING.md](https://github.com/opspec-pkgs/project/blob/main/CONTRIBUTING.md)
