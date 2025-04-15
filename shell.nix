{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    kubernetes-helm
    kustomize

    terraform
    terragrunt

  ];

  shellHook = ''
    # minikube addons enable ingress
  '';
}
