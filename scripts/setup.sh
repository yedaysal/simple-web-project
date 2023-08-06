#!/bin/sh

# Description: This script does the following:
# - Packages the application into a Docker image
# - Starts a minikube cluster
# - Uploads the application docker image to the started minikube cluster's image registry
# - Enables minikube ingress addon
# - Applies k8s manifests
# Author: Yunus Emre Daysal

echo "Packaging the application..."
cd .. ; docker build -t simple-web-app:test .
echo

echo "Starting a minikube cluster..."
minikube start
echo

echo "Uploading application image to minikube..."
minikube image load simple-web-app:test
echo

echo "Enabling minikube ingress addon..."
minikube addons enable ingress
echo

echo "Waiting for ingress-nginx-controller to become available..."
sleep 30
echo

echo "Applying k8s manifests..."
cd k8s/
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
echo

echo "Opening SSH tunnel to access application..."
ssh -f -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -N docker@127.0.0.1 -p $(docker port minikube | grep -w 22 | cut -d ":" -f2) -i ~/.minikube/machines/minikube/id_rsa -L 8181:localhost:80
echo

echo "The application is accessible via http://localhost:8181."
echo