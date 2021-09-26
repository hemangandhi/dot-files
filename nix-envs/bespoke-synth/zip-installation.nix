with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "BespokeSynth";
  pname = "BespokeSynth";
  # Based on the bespoke_dependencies.sh file in the ZIP for linux (sorted alphabetically)
  src = fetchzip {
      url = "https://www.bespokesynth.com/builds/Bespoke-Linux.zip";
      sha256 = "1l3xg1l3pdxwrnq8r9p3410cc0ddci1iji7kh8hdr0wn15f2w927";
  };
  
  buildInputs = [
    alsa-lib
    curl
    file
    freeglut
    freetype
    gtk3
    libjack2
    libusb1
    mesa
    pkg-config
    python3Full
    webkitgtk
    xorg.libX11
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXrandr
  ];

  installPhase = ''
  cp -R . $out/
  '';

#  meta = with lib; {
#    homepage = "https://www.bespokesynth.com";
#    description = "Synth";
#    liscence = liscences.gpl3;
#    platforms = platforms.linux;
#  };
}
