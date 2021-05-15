with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "obs-env";
  buildInputs =  with pkgs; [
     # off https://nixos.wiki/wiki/Nvidia
     git gitRepo gnupg autoconf curl
     procps gnumake utillinux m4 gperf unzip
     cudatoolkit linuxPackages.nvidia_x11
     libGLU libGL
     xorg.libXi xorg.libXmu freeglut
     xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib 
     ncurses5 stdenv.cc binutils
     # obs
     ffmpeg nv-codec-headers obs-studio
  ];
   shellHook = ''
      export CUDA_PATH=${pkgs.cudatoolkit}
      # export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib:${pkgs.ncurses5}/lib
      export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
      export EXTRA_CCFLAGS="-I/usr/include"
   '';
}
