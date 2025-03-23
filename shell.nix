{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    minikube
    kubernetes-helm
  ];

  shellHook = ''
    alias k=kubectl


    # minikube addons enable ingress
  '';
}
