#!/bin/bash

VERSION=1.28.2


sudo kubeadm init --kubernetes-version $VERSION --pod-network-cidr=192.168.0.0/16
