{ config, pkgs, ... }:

{
  home.packages = [
     pkgs.gimp
     pkgs.glxinfo
     pkgs.google-chrome
     pkgs.obs-studio
     pkgs.scrot
     pkgs.steam
     pkgs.xorg.xev
     pkgs.xorg.xmodmap
     # pkgs.zathura
  ];

  programs.git = {
    userName = "Heman Gandhi";
    userEmail = "hemangandhi@gmail.com";
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.magit
      epkgs.nix-mode
      epkgs.company
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = "/home/heman/.config/nixpkgs/home.nix";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
