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

### begin create/update
echo "checking for exiting kubernetes cluster"
if [ "$(az aks list --resource-group "$resourceGroup")" != "[]" ]
then
  echo "found exiting kubernetes cluster"
else
  aksCreateCmd='az aks create'
  aksCreateCmd=$(printf "%s --name %s" "$aksCreateCmd" "$name")
  aksCreateCmd=$(printf "%s --resource-group %s" "$aksCreateCmd" "$resourceGroup")
  aksCreateCmd=$(printf "%s --admin-username %s" "$aksCreateCmd" "$adminUsername")
  aksCreateCmd=$(printf "%s --dns-name-prefix %s" "$aksCreateCmd" "$dnsNamePrefix")
  aksCreateCmd=$(printf "%s --kubernetes-version %s" "$aksCreateCmd" "$kubernetesVersion")
  aksCreateCmd=$(printf "%s --location %s" "$aksCreateCmd" "$location")
  aksCreateCmd=$(printf "%s --node-count %s" "$aksCreateCmd" "$nodeCount")
  aksCreateCmd=$(printf "%s --node-osdisk-size %s" "$aksCreateCmd" "$nodeOSDiskSize")
  aksCreateCmd=$(printf "%s --node-vm-size %s" "$aksCreateCmd" "$nodeVmSize")
  aksCreateCmd=$(printf "%s --ssh-key-value /sshKeyValue" "$aksCreateCmd")

  # handle opts
  if [ "$clientSecret" != " " ]; then
    aksCreateCmd=$(printf "%s --client-secret %s" "$aksCreateCmd" "$clientSecret")
  fi

  if [ "$servicePrincipal" != " " ]; then
    aksCreateCmd=$(printf "%s --service-principal %s" "$aksCreateCmd" "$servicePrincipal")
  fi

  echo "creating kubernetes cluster"
  eval "$aksCreateCmd"
fi

### end create/update
