{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    minikube
    kubernetes-helm
    helmfile
  ];

  shellHook = ''
    # minikube addons enable ingress
  '';
}
