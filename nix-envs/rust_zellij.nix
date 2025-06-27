let
  rust_overlay = import (builtins.fetchTarball https://github.com/oxalica/rust-overlay/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  rust_of_choice = nixpkgs.rust-bin.stable.latest.default.override {
    targets = ["x86_64-unknown-linux-musl" "wasm32-wasip1"];
    extensions = ["rust-src"];
  };
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        rust-vim
        coc-rust-analyzer
      ];
    };
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "rust-env";
  buildInputs = [
    # Zellij WASM I/O
    nixpkgs.protobuf_29

    # linter
    nixpkgs.clippy
    # builder
    nixpkgs.cargo
    # compiler
    rust_of_choice
    # formatter
    # editor
    nvim
    # coc needs this
    nixpkgs.nodejs
  ];
}
