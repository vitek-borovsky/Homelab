#!/bin/sh
cd $(dirname $0)

set -eu
set -x



#### Create namespaces
for filename in **/namespace.yaml; do
    kubectl -f apply $filename
done

### Install everything manifest
# Note: this command would fail if some namespace would not yet be created
kubectl apply -f .

helmfile apply -f helmfile.yaml
