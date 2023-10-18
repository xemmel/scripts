#!/bin/bash

VERSION=1.28.0-00


sudo kubeadm init --kubernetes-version $VERSION --pod-network-cidr=192.168.0.0/16
