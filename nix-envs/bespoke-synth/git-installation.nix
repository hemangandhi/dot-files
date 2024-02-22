with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "BespokeSynth";
  # NOTE: we specifically don't want the ZIP since the binary in there seems utterly broken.
  src = fetchGit {
    url = "http://github.com/BespokeSynth/BespokeSynth";
    rev = "c0cb1441064ad32cb7eb69e0a4a33b57c2d8473b";
    ref = "HEAD";
    # We need the JUCE library (TODO: make a separate package?)
    submodules = true;
    # sha256 = "0mngq9bly8qi4b9w5j63za5k14wn78rdv8ijxzprlv5m6m7assxd";
  };

  nativeBuildInputs = [
    cmake
    gcc
  ];

  # Based on the bespoke_dependencies.sh file in the ZIP for linux (sorted alphabetically).
  # Except, cmake and g++ are in the nativeBuildInputs and there's an extra font package
  # since frabk.ttf (Franklin Gothic Book) doesn't seem to be available.
  buildInputs =  [
    alsa-lib
    curl
    freeglut
    freetype
    gtk3
    libjack2
    libusb1
    mesa
    pkg-config
    python3Full
    webkitgtk
    # frabk.ttf notice me.
    winePackages.fonts
    xorg.libX11
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXrandr
  ];
  configurePhase = "cmake -Bignore/build -DCMAKE_BUILD_TYPE=Release";
  buildPhase = "cmake --build ignore/build --config Release";
  installPhase = ''
    ls -R ignore/build/Source
    mv ignore/build/Source/BespokeSynth_artefacts/Release $out
  '';
}
