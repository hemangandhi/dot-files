# For https://github.com/nccvector/rust-rendering/tree/master

let
  rust_overlay = import (builtins.fetchTarball https://github.com/oxalica/rust-overlay/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  rust_of_choice = nixpkgs.rust-bin.stable.latest.rust.override {
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
  name = "rust-renderer-env";
  buildInputs = [
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
    # From https://github.com/sfackler/rust-openssl/issues/1663#issuecomment-1235973065
    nixpkgs.libiconv
    nixpkgs.openssl
    nixpkgs.pkg-config
    # russimp's error message and raylib
    nixpkgs.glibc
    nixpkgs.assimp
    nixpkgs.libclang
    nixpkgs.llvmPackages_12.libcxxClang
    # raylib -- also https://discourse.nixos.org/t/problems-building-raylib-rs/45142
    nixpkgs.cmakeMinimal
    nixpkgs.libGL
    nixpkgs.xorg.libXrandr
    nixpkgs.xorg.libXinerama
    nixpkgs.xorg.libXcursor
    nixpkgs.xorg.libXi
    # embree itself
    nixpkgs.embree
    # rust-rendering? Needs -lz, not sure if it's just Rust.
    nixpkgs.zlib
  ];
  # also raylib -- also https://discourse.nixos.org/t/problems-building-raylib-rs/45142
  LIBCLANG_PATH = "${nixpkgs.libclang.lib}/lib";
  # bindgen? bindgen inside raylib? https://github.com/NixOS/nixpkgs/issues/52447#issuecomment-853429315
  BINDGEN_EXTRA_CLANG_ARGS = "-isystem ${nixpkgs.llvmPackages.libclang.lib}/lib/clang/17/include -isystem ${nixpkgs.glibc.dev}/include";
  RUST_EMBREE_RTCORE_HEADER_PATH = "${nixpkgs.embree}/include/embree4/rtcore.h";
}
