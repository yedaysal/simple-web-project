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

### Deployment Instructions

To deploy the application, follow the instructions below:

1. Start a minikube cluster:

```console
minikube start
```

2. Upload the application Docker image to minikube registry:

```console
minikube image load simple-web-app:test
```

3. Verify that the application Docker image is uploaded to minikube registry:

```console
minikube image ls | grep -w simple-web-app
```

4. Enable minikube ingress addon to deploy ingress-nginx-controller to minikube:

```console
minikube addons enable ingress
```

5. Go to the directory which contains k8s manifests (`~/simple-web-project/k8s`):

```console
cd ~/simple-web-project/k8s
```

6. Apply the application deployment manifest:

```console
kubectl apply -f deployment.yaml
```

7. Apply the application service manifest:

```console
kubectl apply -f service.yaml
```

8. Apply the application ingress manifest:

```console
kubectl apply -f ingress.yaml
```

Now the application should be deployed successfully and accessible via ingress.

## Accessing The Application

The method of accessing the application varies depending on the Docker installation type. If the underlying operating system supports native Docker installation (without Docker Desktop support, e.g. Linux) the application can be accessed directly via the IP address of the minikube container (since the ingress-nginx-controller NodePort service listens on the port 80 in the minikube container):

```console
curl http://$(minikube ip)
```

Otherwise, which means Docker is installed via Docker Desktop support (e.g., macOS and Windows), any connection to the minikube container cannot be established directly since the minikube container runs in a VM managed by Docker Desktop. In this case, an SSH tunnel needs to be opened to the ingress-nginx-controller NodePort service in the minikube container. Open an SSH tunnel using the host port mapped to the minikube container's SSH port:

```console
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -N docker@127.0.0.1 -p $(docker port minikube | grep -w 22 | cut -d ":" -f2) -i ~/.minikube/machines/minikube/id_rsa -L 8181:localhost:80
```

After the execution of the command above, the application should be accessible via [http://localhost:8181](http://localhost:8181) URL.

> **Note**
> To change the port number in the application access URL above, change the port number `8181` at the end of the SSH tunnel command to something else.
