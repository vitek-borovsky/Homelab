{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    kubernetes-helm
    kustomize

    (python313.withPackages (ps: with ps; [
        pulumi
    ]))
  ];

  shellHook = ''
  '';
}
