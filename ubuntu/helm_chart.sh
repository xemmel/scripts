#!/bin/bash

# Prompt the user for the name of the chart
read -p "Enter the name of the helm chart: " chartname

# Create the required directories and files
sudo mkdir $chartname
sudo mkdir "$chartname/templates"
sudo touch "$chartname/values.yaml"

# Populate Chart.yaml with the chart name
cat > "$chartname/Chart.yaml" <<EOF
apiVersion: v2
name: $chartname
description: A Helm chart for $chartname
version: 0.1.0
EOF

echo "Helm chart $chartname has been created!"
