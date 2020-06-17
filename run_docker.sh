#!/usr/bin/env bash

# BUILD LANGITSTARS IMAGE

# Step 1:
# Build langitstars image
docker build -t ecoden/langitstars-k8s -f ./app/Dockerfile ./app

# Step 2:
# List docker images
docker image ls

# Step 3:
# Run the container from the image:
docker run -d -p 5000:5000 ecoden/langitstars-k8s

# Step 4:
# Push Image to Docker Registry
docker push ecoden/langitstars-k8s

# BUILD THE NGINX

# Step 1:
# Build langitstars image
docker build -t ecoden/nginxproxy -f ./nginx/Dockerfile ./nginx

# Step 2:
# List docker images
docker image ls

# Step 3:
# Push Image to Docker Registry
docker push ecoden/nginxproxy
