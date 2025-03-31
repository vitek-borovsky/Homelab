# Homelab
Each folder represents an aplication. Each of these application is
in its own namespace of the same name

if you are in a minikube you also need the
minikube addons enable ingress
or setup up diffrent ingress controller


## Installation
### Prepare namespaces

### Prepare secrets
#### Nextcloud
#TODO

### Using helm
#### Install helm
#TODO

#### Install helmfile
#TODO

#### Install helm-diff plugin
helm plugin install https://github.com/databus23/helm-diff

helmfile apply -f helmfile.yaml
