# Copied off https://github.com/NixOS/nixpkgs/blob/nixos-21.05/pkgs/applications/editors/music/tuxguitar/default.nix#L35
# to fix https://github.com/NixOS/nixpkgs/issues/125945

{ pkgs ? import <nixpkgs> {} }:

let metadata = assert pkgs.stdenv.hostPlatform.system == "i686-linux" || pkgs.stdenv.hostPlatform.system == "x86_64-linux";
  if pkgs.stdenv.hostPlatform.system == "i686-linux" then
    { arch = "x86"; sha256 = "27675c358db237df74d20e8676000c25a87b9de0bb0a6d1c325e8d6db807d296"; }
  else
    { arch = "x86_64"; sha256 = "298555a249adb3ad72f3aef72a124e30bfa01cd069c7b5d152a738140e7903a2"; };
in pkgs.stdenv.mkDerivation rec {
  version = "1.5.2";
  pname = "tuxguitar";

  src = pkgs.fetchurl {
    url = "mirror://sourceforge/tuxguitar/${pname}-${version}-linux-${metadata.arch}.tar.gz";
    sha256 = metadata.sha256;
  };

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r dist lib share $out/
    cp tuxguitar.sh $out/bin/tuxguitar
    ln -s $out/dist $out/bin/dist
    ln -s $out/lib $out/bin/lib
    ln -s $out/share $out/bin/share
    wrapProgram $out/bin/tuxguitar \
      --set JAVA "${pkgs.jdk8}/bin/java" \
      --prefix LD_LIBRARY_PATH : "$out/lib/:${pkgs.lib.makeLibraryPath [ pkgs.swt_jdk8 pkgs.alsaLib pkgs.jack2 pkgs.fluidsynth pkgs.libpulseaudio ]}" \
      --prefix CLASSPATH : "${pkgs.swt_jdk8}/jars/swt.jar:$out/lib/tuxguitar.jar:$out/lib/itext.jar"
  '';

  meta = with pkgs.lib; {
    description = "A multitrack guitar tablature editor";
    longDescription = ''
      TuxGuitar is a multitrack guitar tablature editor and player written
      in Java-SWT. It can open GuitarPro, PowerTab and TablEdit files.
    '';
    homepage = "http://www.tuxguitar.com.ar/";
    license = licenses.lgpl2;
    maintainers = [ maintainers.ardumont ];
    platforms = platforms.linux;
  };
}
