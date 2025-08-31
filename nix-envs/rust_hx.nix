# Rust but with Helix and Zellij instead of nvim.

let
  rust_overlay = import (builtins.fetchTarball https://github.com/oxalica/rust-overlay/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  rust_of_choice = nixpkgs.rust-bin.stable.latest.rust.override {
    extensions = ["rust-src"];
  }; in
nixpkgs.stdenv.mkDerivation {
  name = "rust-hx-env";
  buildInputs = [
    # linter
    nixpkgs.clippy
    # builder
    nixpkgs.cargo
    # compiler
    rust_of_choice
    # formatter
    # editor
    nixpkgs.helix
    # Since the editor doesn't embed terminals. T_T
    nixpkgs.zellij
  ];
}
