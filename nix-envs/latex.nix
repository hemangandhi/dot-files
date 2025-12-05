let
  nixpkgs = import <nixpkgs> {};
  nvim = import ../../nvim.nix ( rec {
    nixPkgs = nixpkgs;
    neovim = nixpkgs.neovim;
    customPackages = with nixpkgs.vimPlugins; {
      start = [
        vimtex
      ];
    };
    extraRC = ''
      " VimTex confs
      let g:vimtex_view_method = 'zathura'
      let g:vimtex_compiler_method = 'tectonic'
    '';
  }); in
nixpkgs.stdenv.mkDerivation {
  name = "latex-env";
  buildInputs = [
    # editor
    nvim
    nixpkgs.nodejs
    # For vimtex
    nixpkgs.tectonic
    # PL
    nixpkgs.texliveTeTeX
    # convenience
    nixpkgs.xclip
    nixpkgs.zathura
  ];
}
