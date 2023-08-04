# Simple Web Project

A modern web project to build a simple service with Docker and deploy it to Kubernetes.

The project contains:

- The web service application code written in Python using FastAPI framework that responds to an HTTP GET request and returns Hostname and Timestamp information
- The Dockerfile that packages the application
- The Kubernetes manifests that deploy the application to a Kubernetes environment and provide external access to the application
- Detailed instructions on how to build and deploy the application
- Configuration files to bootstrap the testing environment

## Technologies

This section provides brief information about the technologies used in the project. The technologies used are:

- [Python](https://www.python.org/) programming language for providing the frameworks to build and serve the application
- [FastAPI](https://fastapi.tiangolo.com/) Python framework to build the application
- [Uvicorn](https://www.uvicorn.org/) ASGI web server implementation for Python to serve the application
- [Docker Engine](https://docs.docker.com/engine/) to package the application
- [Minikube](https://minikube.sigs.k8s.io/docs/) for testing the application deployment on Kubernetes
- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) for communicating with the local Kubernetes distribution (Minikube)

