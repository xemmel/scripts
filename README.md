

```bash
curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/container_d.sh | bash


```





sl "C:\code\private\kubernetes2022\Infrastructure\Own_Cluster\Create_Infrastructure\VMS\Lone_VM"



. .\VNET\select_existing_vnet_v3.ps1

. .\VNET\select_existing_subnet_v3.ps1




curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/container_d.sh | bash


curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/kubeadm.sh | bash


curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/kubeadm_init.sh | bash


Flannel Manually (I think)

curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/config_kubectl.sh | bash



Autocomplete manuall (I think)
curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/autocomplete.sh | bash

sudo kubeadm join 10.56.10.4:6443 --token eh3mtr.4yxqn4rntdxgzaos \
        --discovery-token-ca-cert-hash sha256:1db232998f1679ed4ef1b323040cb197c5fd5567cc425532fffe24e7f4fc70df
		
		


kubectl create deployment helloworld --replicas 4 --image mcr.microsoft.com/azuredocs/aks-helloworld:v1




