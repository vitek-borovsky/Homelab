{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    minikube
    kubernetes-helm
    helmfile
    kustomize

  ];

  shellHook = ''
    # minikube addons enable ingress
  '';
}
