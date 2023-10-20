#!/bin/bash

# Check if the chart name argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <chart-name>"
    exit 1
fi

chartname=$1

# Create the required directories and files
mkdir $chartname
mkdir "$chartname/templates"
touch "$chartname/values.yaml"

# Populate Chart.yaml with the chart name
cat > "$chartname/Chart.yaml" <<EOF
apiVersion: v2
name: $chartname
description: A Helm chart for $chartname
version: 0.1.0
EOF

echo "Helm chart $chartname has been created!"
