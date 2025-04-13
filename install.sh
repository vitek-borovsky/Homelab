#!/bin/sh
cd $(dirname $0)

set -eu

kustomize build --enable-helm ingress/ | \
    kubectl apply -f -


kustomize build --enable-helm . | \
    kubectl apply -f -
