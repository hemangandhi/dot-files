{ config, pkgs, lib, ... }:

# Notices bulge.

# 1) Allow nixpkgs to install the unfree/insecure stuff
# 2) Install packages I won't configure.
# 3) git
# 4) neovim
#   a) vimrc
#   b) coc
#   c) plugins
# 5) picom -- yote?
# 6) xresources
# 7) xinitrc (pointless?)
# That's all that's mine. The rest is 義理.

# TODO: i3とi3-statusもわかれ

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "ffmpeg-2.8.17"
    ];
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "discord"
      "google-chrome"
    ];
  };

  home.packages = [
     pkgs.chrysalis
     pkgs.discord
     pkgs.gimp
     pkgs.google-chrome
     pkgs.libreoffice
     pkgs.scrot
     pkgs.signal-desktop
     pkgs.stepmania
     pkgs.unzip
     pkgs.vlc
     pkgs.xorg.xev
     pkgs.contour
     # Old packages
     # pkgs.glxinfo
     # pkgs.plover.dev
     # pkgs.osu-lazer
     # pkgs.steam
     # pkgs.xorg.xmodmap
     # pkgs.zathura
  ];

  programs.git = {
    userName = "Heman Gandhi";
    userEmail = "hemangandhi@gmail.com";
  };

  programs.neovim = {
    enable = true;

    extraConfig = ''
filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
set listchars=tab:▒░,trail:▓
set list

set number
set hlsearch
set ignorecase
set smartcase

set number

set hidden

set fileformats=unix,dos,mac
set directory=$HOME/.config/nvim/swapfiles//

let &undodir="/home/heman/.config/nvim/undodir/"
set undofile

set completeopt=menuone,longest,preview

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
    '';

    # install needed binaries here
    extraPackages = with pkgs; [
      xclip
#     nodejs
    ];

#    coc = {
#      enable = true;
#    };

    plugins = with pkgs.vimPlugins; [
#     coc-git
      vim-lsp
      vim-nix
      molokai
      nvim-treesitter
    ];
  };

#  services.picom = {
#    enable = true;
#    settings = {
#        inactive-dim = 0.2;
#        focus-exclude = [
#          "_NET_WM_STATE@:32a = '_NET_WM_STATE_FULLSCREEN'"
#        ];
#    };
#  };

  xresources.properties = {
    "xterm*Background" = "black";
    "xterm*Foreground" = "white";
    "xterm*faceSize" = "28";
    "xterm*font" = "*-fixed-*-*-*-18-*";
    "xterm*metaSendsEscape" = "true";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = "/home/heman/.config/home-manager/home.nix";
  };

  # End of my personal stuff -- now it's just home-manager.

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
  home.username = "heman";
  home.homeDirectory = "/home/heman";

}

