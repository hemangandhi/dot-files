# Heman kun no konjin teki na config.
# Sawaranaide... b-b-baka
# YARUBEKI: /home/heman no naka in ireru you ni suru

{ config, pkgs, ... }:

let myXmodmap = pkgs.writeText "my.Xmodmap" ''
  keycode 66 = Control_L
  keycode 9 = Caps_Lock
  keycode 37 = Escape
  keycode 108 = Multi_key
  clear Lock
  add Lock = Caps_Lock
  clear Control
  add Control = Control_L
 ''; # shita ni "backend = "glx"" okubeki desu
 myNeocompCfg = pkgs.writeText "my-neocomp-config.conf" ''
  glx-no-stencil = true;
  glx-no-rebind-pixmap = true;
  vsync = true;
  inactive-dim = 0.7;
  opacity-rule = [
    "99:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_FULLSCREEN'",
    "99:_NET_WM_STATE@[1]:32a = '_NET_WM_STATE_FULLSCREEN'",
    "99:_NET_WM_STATE@[2]:32a = '_NET_WM_STATE_FULLSCREEN'",
    "99:_NET_WM_STATE@[3]:32a = '_NET_WM_STATE_FULLSCREEN'",
    "99:_NET_WM_STATE@[4]:32a = '_NET_WM_STATE_FULLSCREEN'",
  ];
 '';
 myXSessionScript = pkgs.writeText "my.xsession-heman" ''
  ${pkgs.picom}/bin/picom -b --config ${myNeocompCfg}
  ${pkgs.xorg.xmodmap}/bin/xmodmap ${myXmodmap}
  ${pkgs.feh}/bin/feh -D 60 --randomize --bg-scale ~/.config/backgrounds/*
  ${pkgs.fcitx}/bin/fcitx&
 '';
 in {
 
  # Japanese input support
  i18n.inputMethod.enabled = "fcitx";
  i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ mozc ];


  services.xserver.displayManager.defaultSession = "none+i3";
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu i3status i3lock
    ];
    extraSessionCommands = ''sh ${myXSessionScript}'';
  };

  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "globalias" "git" ];
  };

  environment.systemPackages = with pkgs; [
     picom # kitai suru wa
     feh
     fcitx fcitx-engines.mozc
  ];
}