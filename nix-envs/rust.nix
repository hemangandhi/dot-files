with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "rust-env";
  buildInputs = [
    # editor
    vimPlugins.rust-vim
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
