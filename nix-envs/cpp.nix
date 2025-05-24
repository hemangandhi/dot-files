let
  nixpkgs = import <nixpkgs> {};
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        coc-nvim
        coc-git
        vim-lsp
        vim-lspconfig
        vim-nix
        nvim-treesitter
        vim-clang-format
      ];
    };
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "cpp-env";
  buildInputs = [
    nixpkgs.gcc
    nixpkgs.clang-tools
    # Editor
    nvim
    # coc needs this
    nixpkgs.nodejs
  ];
}
