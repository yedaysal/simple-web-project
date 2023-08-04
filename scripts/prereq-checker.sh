#!/bin/sh

# Description: The script that checks prerequisite software.
# Author: Yunus Emre Daysal

txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 1) # Red text
txtgrn=$(tput setaf 2) # Green text
txtbold=$(tput bold) # Bold text

echo "Checking if ${txtbold}Docker${txtrst} is installed..."
if [ $(which docker) ] 
then
    echo "${txtgrn}${txtbold}Docker is installed.${txtgrn}${txtrst}"
else
    echo "${txtred}${txtbold}Docker is not installed!${txtrst}${txtred} Please visit ${txtbold}https://docs.docker.com/engine/install/${txtrst}${txtred} to install it and re-run this script to verify the installation.${txtred}"
fi
echo ""

echo "${txtrst}Checking if ${txtbold}kubectl${txtrst} is installed...${txtrst}"
if [ $(which kubectl) ] 
then
    echo "${txtgrn}${txtbold}kubectl is installed.${txtgrn}${txtrst}"
else
    echo "${txtred}${txtbold}kubectl is not installed!${txtrst}${txtred} Please visit ${txtbold}https://kubernetes.io/docs/tasks/tools/${txtrst}${txtred} to install it and re-run this script to verify the installation.${txtred}"
fi
echo ""

echo "${txtrst}Checking if ${txtbold}Helm${txtrst} is installed...${txtrst}"
if [ $(which helm) ] 
then
    echo "${txtgrn}${txtbold}Helm is installed.${txtgrn}${txtrst}"
else
    echo "${txtred}${txtbold}Helm is not installed!${txtrst}${txtred} Please visit ${txtbold}https://helm.sh/docs/intro/install/${txtrst}${txtred} to install it and re-run this script to verify the installation.${txtred}"
fi
echo ""

echo "${txtrst}Checking if ${txtbold}Minikube${txtrst} is installed...${txtrst}"
if [ $(which minikube) ] 
then
    echo "${txtgrn}${txtbold}Minikube is installed.${txtgrn}${txtrst}"
else
    echo "${txtred}${txtbold}Minikube is not installed!${txtrst}${txtred} Please visit ${txtbold}https://minikube.sigs.k8s.io/docs/start/${txtrst}${txtred} to install it and re-run this script to verify the installation.${txtred}"
fi
echo ""
