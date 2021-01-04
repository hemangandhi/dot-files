with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "mlir-env";
  buildInputs = [
    # The requirements for MLIR as stated in https://mlir.llvm.org/getting_started/
    # (alphabetic order)
    bzip2
    clang
    cmake
    gcc
    llvmPackages.bintools
    ninja
    python3
    zip
    # editor
    emacs26Packages.company
    emacs26Packages.flycheck
    emacs26Packages.eglot
  ];
}
