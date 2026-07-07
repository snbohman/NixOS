{ pkgs, inputs, ... }:
let
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    ## X11
    pkgs.xorg.libX11
    pkgs.xorg.libXrandr
    pkgs.xorg.libXi
    pkgs.xorg.libXcursor
    pkgs.xorg.libXinerama
    pkgs.xorg.libXext
    pkgs.libGL 

    ## C / C++
    clang
    cmake
    gnumake
    premake5
    bear

    # odin
    pkgsLatest.odin
    pkgsLatest.ols
    pkgsLatest.raylib

    # zig
    inputs.zig-overlay.packages.${pkgs.system}.master
    inputs.zls.packages.${pkgs.system}.zls

    # language servers
    nixd
    lua-language-server 
    llvmPackages_20.clang-tools

    ## Python
    python311
    uv
  ];
}
