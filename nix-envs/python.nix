let
  nixpkgs = import <nixpkgs> {};
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        coc-pyright
      ];
    };
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "py-env";
  buildInputs = [
    # Python (arbitrarily picking a version)
    nixpkgs.python311
    nixpkgs.python311Packages.python-lsp-server
    nixpkgs.python311Packages.mypy
    nixpkgs.python311Packages.ruff
    # Package management (within Python)
    nixpkgs.python311Packages.pip
    # Editor
    nvim
    # coc needs this
    nixpkgs.nodejs
  ];
}
