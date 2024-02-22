let
  nixpkgs = import <nixpkgs> {};
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        nvim-treesitter-parsers.zig
        zig-vim
      ];
    };
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "zig-env";
  buildInputs = [
    # lang
    nixpkgs.zig
    # lsp
    nixpkgs.zls
    # editor
    nvim
    # coc needs this
    nixpkgs.nodejs
    # makes life way better
    nixpkgs.xclip
  ];
}
