# Difference between this an rust.nix?
# This uses overlays so that we can switch Rust versions
# for experimenting with nightly etc.
# It's probably better to use this with a rust toolchain manifest
# too so that we can have reproducible builds through rustup
# or nix.

let
  rust_overlay = import (builtins.fetchTarball https://github.com/oxalica/rust-overlay/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  rust_of_choice = nixpkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default);
in
nixpkgs.stdenv.mkDerivation {
  name = "rustup-env";
  buildInputs = [
    # editor
    nixpkgs.emacs26Packages.company
    nixpkgs.emacs26Packages.rustic
    nixpkgs.emacs26Packages.flycheck
    nixpkgs.emacs26Packages.flycheck-rust
    nixpkgs.emacs26Packages.flymake
    nixpkgs.emacs26Packages.flymake-rust
    nixpkgs.emacs26Packages.eglot
    nixpkgs.emacs26Packages.cargo
    # rust
    rust_of_choice
  ];
}
