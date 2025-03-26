{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    minikube
    kubernetes-helm
  ];

  shellHook = ''
    alias k=kubectl
    alias set-namespace='kubectl config set-context --current --namespace'
    alias kbusy='kubectl run debug --rm -it --image=busybox --restart=Never -- /bin/sh'


    # minikube addons enable ingress
  '';
}
