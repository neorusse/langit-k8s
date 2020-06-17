#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# Deploy service and deployment
microk8s kubectl apply -f k8s-manifest.yaml

# Step 2:
# List kubernetes pods
microk8s kubectl get pod


