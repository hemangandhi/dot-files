let
  nixpkgs = import <nixpkgs> {};
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        plenary-nvim
        lean-nvim
      ];
    };
    extraRC = "let &runtimepath = &runtimepath . ',/home/heman/dot-files/nix-envs/nvim-lua-inits/lean-init'";
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "lean-env";
  buildInputs = [
    # convenience
    nixpkgs.xclip
    # editor
    nvim
    nixpkgs.nodejs
    # PL
    nixpkgs.lean4
  ];
}
