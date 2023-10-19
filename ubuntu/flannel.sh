#!/bin/bash


curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.3/manifests/canal.yaml -O

POD_CIDR="192.168.0.0/16" \
sed -i -e "s?10.244.0.0/16?$POD_CIDR?g" canal.yaml

kubectl apply -f canal.yaml


## kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml