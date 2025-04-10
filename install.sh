#!/bin/sh
cd $(dirname $0)

set -eu

minikube addons enable ingress

kustomize build --enable-helm . | \
    kubectl apply -f -
