#!/bin/sh
cd $(dirname $0)

set -eu

kustomize build --enable-helm . | \
    kubectl apply -f -
