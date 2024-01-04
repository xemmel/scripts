


```bash
curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/container_d.sh | bash


```



### Install all

```powershell

sl "C:\code\private\kubernetes2022\Infrastructure\Own_Cluster\Create_Infrastructure\VMS\Lone_VM"



. .\VNET\select_existing_vnet_v3.ps1

. .\VNET\select_existing_subnet_v3.ps1




## NAME="container_d.sh"
## NAME="kubeadm.sh"
## NAME="kubeadm_init.sh"
NAME="config_kubectl.sh"


curl -s -o $NAME https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/$NAME | bash
chmod +x $NAME
./$NAME


```bash

#!/bin/bash

# Array containing the script names
script_names=("container_d.sh" "kubeadm.sh" "kubeadm_init.sh")

# Base URL
base_url="https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu"

# Loop over the script names
for NAME in "${script_names[@]}"; do
    # Download the script
    curl -s -o $NAME $base_url/$NAME
    # Make the script executable
    chmod +x $NAME
    # Run the script
    ./$NAME
done



```


curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/kubeadm.sh | bash


curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/kubeadm_init.sh | bash


Flannel Manually (I think)

curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/config_kubectl.sh | bash


curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/helm_install.sh | bash

Autocomplete manuall (I think)
curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/autocomplete.sh | bash

sudo kubeadm join 10.56.10.4:6443 --token eh3mtr.4yxqn4rntdxgzaos \
        --discovery-token-ca-cert-hash sha256:1db232998f1679ed4ef1b323040cb197c5fd5567cc425532fffe24e7f4fc70df
		
		


kubectl create deployment helloworld --replicas 4 --image mcr.microsoft.com/azuredocs/aks-helloworld:v1


```


### Start everything

```powershell

. C:\code\azure\init.ps1

az vm start -g RG-KUBEVM-MASTER10 -n kube-master-10 --no-wait --subscription $subid_intit_teachingtest

az vm start -g RG-KUBEVM-WORKER11 -n kube-worker-11 --no-wait --subscription $subid_intit_teachingtest

az vm start -g RG-KUBEVM-WORKER12 -n kube-worker-12 --no-wait --subscription $subid_intit_teachingtest

```

### Stop everything


```powershell

. C:\code\azure\init.ps1

az vm deallocate -g RG-KUBEVM-MASTER10 -n kube-master-10 --no-wait --subscription $subid_intit_teachingtest

az vm deallocate -g RG-KUBEVM-WORKER11 -n kube-worker-11 --no-wait --subscription $subid_intit_teachingtest

az vm deallocate -g RG-KUBEVM-WORKER12 -n kube-worker-12 --no-wait --subscription $subid_intit_teachingtest

```


### Helm chart

```powershell


read -p "Enter the name of the helm chart: " chartname && \
curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/helm_chart.sh | bash -s -- $chartname

```