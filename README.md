# Simple Web Project

A modern web project to build a simple service with Docker and deploy it to Kubernetes.

The project contains:

- The web service application code written in Python using FastAPI framework that responds to an HTTP GET request and returns Hostname and Timestamp information
- The Dockerfile that packages the application
- The Kubernetes manifests that deploy the application to a Kubernetes environment and provide external access to the application
- Detailed instructions on how to build and deploy the application
- Configuration files to bootstrap the testing environment

## Table of Contents

- [Technologies](#technologies)
- [Requirements](#requirements)
- [Instructions](#instructions)
  - [Build](#build)

## Technologies

This section provides brief information about the technologies used in the project. The technologies used are:

- [Python](https://www.python.org/) programming language for providing the frameworks to build and serve the application
- [FastAPI](https://fastapi.tiangolo.com/) Python framework to build the application
- [Uvicorn](https://www.uvicorn.org/) ASGI web server implementation for Python to serve the application
- [Docker Engine](https://docs.docker.com/engine/) to package the application
- [Minikube](https://minikube.sigs.k8s.io/docs/) for testing the application deployment on Kubernetes
- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) for communicating with the local Kubernetes distribution (Minikube)

## Requirements

In order the application to be built, deployed and tested successfully, the underlying system should meet the following software:

- Docker
- Minikube
- kubectl

> **Tip**
> To check whether the required software installed, execute the [`prereq-checker.sh`](./scripts/prereq-checker.sh) shell script.

> **Note**
> The underlying system should meet the hardware requirements to run above software.

> **Note**
> To prevent possible errors that may occur related to `docker` command permissions, add the user account which will be used to build and deploy the application to **docker** group by executing `sudo usermod -aG docker <username>` command, then log off and log in to the system.

## Instructions

This section provides the instructions on how to build and deploy the application.

### Build Instructions

To build the application, follow the instructions below:

1. Clone this repository using `git clone` command into the current user's home directory:

```console
cd ; git clone https://github.com/yedaysal/simple-web-project.git
```

2. cd into the local repository directory `~/simple-web-project`:

```console
cd ~/simple-web-project
```

3. Run `docker build` command the package the application:

```console
docker build -t simple-web-app:test .
```

The application Docker image should be ready to be deployed now.
