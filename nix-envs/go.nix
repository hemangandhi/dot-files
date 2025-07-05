let
  nixpkgs = import <nixpkgs> {};
in
nixpkgs.stdenv.mkDerivation {
  name = "golang-env";
  buildInputs = [
    # editor
    nixpkgs.helix
    # PL
    nixpkgs.go
    # LSP
    nixpkgs.gopls
  ];
}
