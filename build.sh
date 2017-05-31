#!/bin/sh

# brew cask install minikube



#curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.19.1/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

docker kill minikube
docker rm minikube

docker build -t chadmoon/minikube:latest .

docker run --privileged --name minikube -v /sys/fs/cgroup:/sys/fs/cgroup:ro chadmoon/minikube:latest