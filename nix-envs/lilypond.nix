let
  nixpkgs = import <nixpkgs> {};
  nvim-lua-sandbox = nixpkgs.vimUtils.buildVimPlugin {
    name = "nvim-lua-sandbox";
    src = nixpkgs.fetchFromGitHub {
      owner = "andyl";
      repo = "nvls";
      rev = "824aa292c1e8ff6e6c0a43b2d5ac2a0782033c7d";
      hash = "sha256-M3RzjaJaw1whMNxjX6V1c8z2SEWsubN0UABL9PS/gxM=";
    };
  };
  nvim = import ./nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = {
      start = [
        nixpkgs.vimPlugins.nvim-lilypond-suite
        nvim-lua-sandbox
      ];
    };
    extraRC = ''
      lua require('nvls').setup()
    '';
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "lilypond-env";
  buildInputs = [
    # editor
    nvim
    nixpkgs.nodejs
    # PL
    nixpkgs.lilypond
    # convenience
    nixpkgs.xclip
    nixpkgs.zathura
  ];
}
