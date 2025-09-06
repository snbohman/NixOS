{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## C / C++
    gcc
    gdb
    gef
    cmake
    gnumake
    valgrind
    premake5
    llvmPackages_20.clang-tools

    ## Python
    python3
    python312Packages.ipython
  ];
}
