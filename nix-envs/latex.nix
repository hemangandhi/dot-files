with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "latex-env";
  buildInputs = [
    # editor
    emacs.pkgs.elpaPackages.company
    emacs.pkgs.elpaPackages.auctex
    # Latex
    
  ];
}
