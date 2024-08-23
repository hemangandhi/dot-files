let
  nixpkgs = import <nixpkgs> {};
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        go-nvim
      ];
    };
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "golang-env";
  buildInputs = [
    # editor
    nvim
    # PL
    nixpkgs.go
  ];
}
