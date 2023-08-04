#!/bin/sh

# Description: This script does the following:
# - Stops the active minikube cluster
# - Deletes the stopped minikube cluster
# - Prunes docker system
# Author: Yunus Emre Daysal

echo "Stopping the active minikube cluster"
minikube stop
echo

echo "Deleting the stopped minikube cluster"
minikube delete
echo

echo "Pruning the docker system"
docker system prune -af
echo
