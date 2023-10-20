#!/bin/bash

sudo apt-get install -y bash-completion
echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc



source <(helm completion bash)
sudo helm completion bash > /etc/bash_completion.d/helm

