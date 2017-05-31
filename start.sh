#!/bin/sh

minikube start --vm-driver=none --use-vendored-driver

kubectl cluster-info

sleep infinity