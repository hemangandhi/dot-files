let
  nixpkgs = import <nixpkgs> {};
in
nixpkgs.stdenv.mkDerivation {
  name = "golang-env";
  buildInputs = [
    # editor
    nixpkgs.helix
    # Since the editor doesn't embed terminals. T_T
    nixpkgs.zellij
    # PL
    nixpkgs.go
    # LSP
    nixpkgs.gopls
  ];
}
