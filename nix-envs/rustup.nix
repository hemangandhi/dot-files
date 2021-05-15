# Difference between this an rust.nix?
# This uses rustup so that we can switch Rust versions
# for experimenting with nightly etc.

with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "rustup-env";
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
