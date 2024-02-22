let
  nixpkgs = import <nixpkgs> {};
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        coc-eslint
      ];
    };
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "js-env";
  buildInputs = [
    # editor
    nvim
    # PL
    nixpkgs.nodejs
  ];
}
