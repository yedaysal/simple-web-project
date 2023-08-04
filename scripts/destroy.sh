#!/bin/sh

# Description: This script does the following:
# - Stops the active minikube cluster
# - Deletes the stopped minikube cluster
# - Prunes docker system
# - Closes the SSH tunnel to the ingress-nginx-controller NodePort service in the minikube container
# Author: Yunus Emre Daysal

echo "Stopping the active minikube cluster..."
minikube stop
echo

echo "Deleting the stopped minikube cluster..."
minikube delete
echo

echo "Pruning the docker system..."
docker system prune -af
echo

echo "Closing the SSH tunnel to ingress-nginx-controller..."
pkill -f "docker@127.0.0.1"
echo
