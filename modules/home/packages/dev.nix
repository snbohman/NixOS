{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## C / C++
    clang
    cmake
    gnumake
    premake5
    bear
    llvmPackages_20.clang-tools

    ## Python
    python311
    python311Packages.ipython

    ## Nixos
    nixd
  ];
}
