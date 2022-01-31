{ config, pkgs, ... }:

{
  home.packages = [
     pkgs.discord
     pkgs.gimp
     pkgs.glxinfo
     pkgs.google-chrome
     pkgs.scrot
     pkgs.steam
     pkgs.vlc
     pkgs.xorg.xev
     pkgs.xorg.xmodmap
     pkgs.unzip
     # pkgs.zathura
     # pkgs.plover.dev
     pkgs.stepmania
     pkgs.osu-lazer
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
      epkgs.ddskk
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
