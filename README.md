## integration-it.com

## scripts

## Table of Content
1. [Kubernetes](#kubernetes)
2. [Powershell](#powershell)
3. [Security](#security)




## Kubernetes



```bash
curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/container_d.sh | bash


```



### Install all

```powershell

sl "C:\code\private\kubernetes2022\Infrastructure\Own_Cluster\Create_Infrastructure\VMS\Lone_VM"



. .\VNET\select_existing_vnet_v3.ps1

. .\VNET\select_existing_subnet_v3.ps1


NAME="update.sh"


NAME="container_d.sh"
##NAME="kubeadm.sh" ## DeP
##NAME="kubeadm_new.sh"

##NAME="kubeadm_init.sh"
##NAME="config_kubectl.sh"
##NAME="autocomplete.sh"



curl -s -o $NAME https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/$NAME | bash;
chmod +x $NAME;
./$NAME;



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


kubectl apply -f https://raw.githubusercontent.com/xemmel/scripts/main/kubernetes/full_deployment.yaml

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

```bash


read -p "Enter the name of the helm chart: " chartname && \
curl -s https://raw.githubusercontent.com/xemmel/scripts/main/ubuntu/helm_chart.sh | bash -s -- $chartname

```

### Manual Helm

```bash

CHARTNAME="morten"
mkdir $CHARTNAME && mkdir $CHARTNAME/templates && touch $CHARTNAME/Chart.yaml && touch $CHARTNAME/templates/deployment.yaml

echo -e "apiVersion: v2\nname: $CHARTNAME\nversion: 0.1.0\ndescription: A Helm chart for Kubernetes\nappVersion: 1.0.0" > $CHARTNAME/Chart.yaml


## cat $CHARTNAME/Chart.yaml


echo -e "apiVersion: apps/v1\nkind: Deployment\nmetadata:\n  name: {{ .Values.app.name }}-deployment\nspec:\n  replicas: 2\n  selector:\n    matchLabels:\n      app: {{ .Values.app.name }}\n  template:\n    metadata:\n      labels:\n        app: {{ .Values.app.name }}\n    spec:\n      containers:\n        - name: {{ .Values.app.name }}-container\n          image: {{ .Values.app.image }}" > $CHARTNAME/templates/deployment.yaml

echo -e "apiVersion: v1\nkind: Service\nmetadata:\n  name: {{ .Values.app.name }}-service\nspec:\n  type: ClusterIP\n  selector:\n    app: {{ .Values.app.name }}\n  ports:\n    - protocol: TCP\n      port: 80\n      targetPort: 80" > $CHARTNAME/templates/service.yaml


cat $CHARTNAME/templates/deployment.yaml

helm install firstinstall $CHARTNAME \
	--namespace $CHARTNAME \
	--create-namespace \
	--set "app.name=$CHARTNAME" \
	--set "app.image=nginx"

kubectl get all --namespace $CHARTNAME

helm uninstall firstinstall --namespace $CHARTNAME

rm $CHARTNAME -rf

```

#### Kind install on Ubuntu


### See https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries for new version

```bash

sudo apt update;
sudo apt upgrade -y;

sudo apt install docker.io -y;
sudo groupadd docker;
sudo usermod -aG docker $USER;
newgrp docker;


(logoff/on)



[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64;
chmod +x ./kind;
sudo mv ./kind /usr/local/bin/kind;




curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl";
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl;


### Helm (One line at a time!!!)

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null;
sudo apt-get install apt-transport-https --yes;
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/;stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list;
sudo apt-get update;
sudo apt-get install helm;



curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm





kind create cluster

### INGRESS CLUSTER

#!/bin/bash

# Define the configuration content
CONFIG_CONTENT=$(cat <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
- role: worker
EOF
)

# Create the configuration file
echo "$CONFIG_CONTENT" > ingress_cluster.yaml

# Create the cluster
kind create cluster --name ingress --config ingress_cluster.yaml




kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml


### Kubectl auto-complete

sudo apt-get install -y bash-completion;
echo "source <(kubectl completion bash)" >> ~/.bashrc;
source ~/.bashrc;


#### Helm auto-complete

echo "source <(helm completion bash)" >> ~/.bashrc;
source ~/.bashrc;



kubectl create namespace test;
kubectl config set-context --current --namespace test;
kubectl apply -f https://raw.githubusercontent.com/xemmel/scripts/main/kubernetes/full_deployment.yaml; 
kubectl get all;

#### Ingress manually

kubectl create ingress simple --rule="/test=test-service:80" --annotation nginx.ingress.kubernetes.io/rewrite-target=/

### Install sqlcmd

curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc;
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list;

sudo apt-get update;
sudo apt-get install mssql-tools18 unixodbc-dev;

echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bash_profile
source ~/.bashrc



### Smaller prompt

sed -i 's/PS1='\''${debian_chroot:+(\$debian_chroot)}\\\[\\033\[01;32m\\\]\\u@\\h\\\[\\033\[00m\\\]:\\\[\\033\[01;34m\\\]\\w\\\[\\033\[00m\\\]\\\$ '\''/PS1='\''${debian_chroot:+(\$debian_chroot)}\\\[\\033\[01;32m\\\]\\u:\\\[\\033\[01;34m\\\]\\w\\\[\\033\[00m\\\]\\\$ '\''/' ~/.bashrc


PS1='\[\033[01;34m\]\u:\w\$ \[\033[01;32m\]'

```

[Back to top](#table-of-content)

## POWERSHELL

### Deploy web app

```powershell

### Deploy webapp

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/deploy_webapp_cli.ps1) } -rgName $rgName -webappName $webAppName -subscriptionId $subid_intit_visa -slot stage"

### Deploy webapp to slot

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/deploy_webapp_cli.ps1) } -rgName $rgName -webappName $webAppName -subscriptionId $subid_intit_visa -slot stage"

```

[Back to top](#table-of-content)


### Swap slots

```powershell

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/swap_webapp_slot.ps1) } -rgName $rgName -webappName $webAppName -subscriptionId $subid_intit_visa -slot stage"

```

[Back to top](#table-of-content)

### View access restrictions

```powershell

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/view_access_restrictions.ps1) } -rgName $rgName -webappName $webAppName -subscriptionId $subid_intit_visa"

#### With slot

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/view_access_restrictions.ps1) } -rgName $rgName -webappName $webAppName/slots/stage -subscriptionId $subid_intit_visa"

```

[Back to top](#table-of-content)

### Deny by default


```powershell

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/set_default_restriction_action.ps1) } -rgName $rgName -webappName $webAppName -subscriptionId $subid_intit_visa -action Deny"

#### With slot

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/set_default_restriction_action.ps1) } -rgName $rgName -webappName $webAppName/slots/stage -subscriptionId $subid_intit_visa -action Deny"

```

[Back to top](#table-of-content)

### Set My Ip Access striction

```powershell

$myIp = ((Invoke-WebRequest ifconfig.me/ip).Content);

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/add_access_restriction.ps1) } -rgName $rgName -webappName $webAppName -subscriptionId $subid_intit_visa -ruleName ownerspc -ipRange $myIp -priority 400"

### With slot 

$myIp = ((Invoke-WebRequest ifconfig.me/ip).Content);

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/azure/webapps/add_access_restriction.ps1) } -rgName $rgName -webappName $webAppName/slots/stage -subscriptionId $subid_intit_visa -ruleName ownerspc -ipRange $myIp -priority 400"
;

```

[Back to top](#table-of-content)


## Security

```powershell

Invoke-Expression "& { $(Invoke-RestMethod https://raw.githubusercontent.com/xemmel/scripts/main/security/get_token.ps1) } -tenant $tenant -clientId $clientId -secret $clientSecret -scope $scope";

$token = get-clipboard;

```

[Back to top](#table-of-content)



### Azure CLI on Ubuntu

```bash

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

sudo apt install dotnet-sdk-8.0 -y

sudo apt  install jq -y




```

### azure functions cli

```bash

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'

sudo apt-get update

sudo apt-get install azure-functions-core-tools-4

```


#### Get Managed Identity Token

```bash

SCOPE="https://storage.azure.com/";
URL="http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=$SCOPE";

### Get Token with pretty json

curl $URL -H "metadata:true" | jq .

### Decode token

curl $URL -H "metadata:true" | jq .access_token -r | cut -d "." -f 2 | base64 -d | jq .




```


#### Azure ACR Image

```bash

kubectl create secret docker-registry azure-secret \
    --docker-server=iitaks.azurecr.io \
    --docker-username=iitaks \
    --docker-password=5VkpxbS4qVIUHiDv3o6fdC=L2v=e1dP6


```

##### Results in 

```yaml

data:
  .dockerconfigjson: eyJhdXRocyI6eyJpaXRha3MuYXp1cmVjci5pbyI6eyJ1c2VybmFtZSI6ImlpdGFrcyIsInBhc3N3b3JkIjoiNVZrcHhiUzRxVklVSGlEdjNvNmZkQz1MMnY9ZTFkUDYiLCJhdXRoIjoiYVdsMFlXdHpPalZXYTNCNFlsTTBjVlpKVlVocFJIWXpielptWkVNOVRESjJQV1V4WkZBMiJ9fX0=

```

> Prettified

```json

{
  "auths": {
    "iitaks.azurecr.io": {
      "username": "iitaks",
      "password": "5VkpxbS4qVIUHiDv3o6fdC=L2v=e1dP6",
      "auth": "aWl0YWtzOjVWa3B4YlM0cVZJVUhpRHYzbzZmZEM9TDJ2PWUxZFA2"
    }
  }
}

```

```yaml

      containers:
        - name: azurecontainer
          image: iitaks.azurecr.io/asyncapi:1.0
      imagePullSecrets:
        - name: azure-secret

```


### Web Server 

```bash

sudo apt install nginx -y

cp /var/www/html/index.html /tmp/index.html
sudo rm /var/www/html/index.html

sudo vim /var/www/html/index.html

```

#### Services

```bash

### List all running

systemctl list-units --type=service --state=running


systemctl list-units --type=service --state=running | grep nginx

systemctl list-units --type=service --all | grep nginx

sudo systemctl start nginx.service;


```

