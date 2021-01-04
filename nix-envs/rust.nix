with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "rust-env";
  buildInputs = [
    # editor
    emacs26Packages.company
    emacs26Packages.rustic
    emacs26Packages.flycheck
    emacs26Packages.eglot
    emacs26Packages.cargo
    # linter
    clippy
    # builder
    cargo
    # compiler
    rustc
    # formatter
    rustfmt
  ];
}
