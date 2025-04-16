#!/bin/sh
cd $(dirname $0)

set -eu

install() {
    kustomize build --enable-helm $1/ | \
        kubectl apply -f -
}

kubectl apply -f storage-class.yaml

install ingress

# TODO wait until ingress controller is ready

install twingate

install homepage
install monitoring

# TODO this fails because test-connection pod that I can't disable
install adminer ||:
# TODO this fails because smoketest pod that I can't disable
install pihole ||:

install mysql


install rss

install nextcloud

# install jellyfin

# install jenkins

install n8n

# install speedtest
