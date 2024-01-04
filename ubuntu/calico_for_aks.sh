#!/bin/bash

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/tigera-operator.yaml

kubectl delete -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/tigera-operator.yaml


kubectl create -f - <<EOF
kind: Installation
apiVersion: operator.tigera.io/v1
metadata:
  name: default
spec:
  kubernetesProvider: AKS
  cni:
    type: Calico
  calicoNetwork:
    bgp: Disabled
    ipPools:
     - cidr: 192.168.0.0/16
       encapsulation: VXLAN
---
apiVersion: operator.tigera.io/v1
kind: APIServer
metadata:
   name: default
spec: {}
EOF

