{ pkgs, inputs, ... }:
let
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    ## X11
    pkgsLatest.xorg.libX11
    pkgsLatest.xorg.libXrandr
    pkgsLatest.xorg.libXi
    pkgsLatest.xorg.libXcursor
    pkgsLatest.xorg.libXinerama
    pkgsLatest.xorg.libXext
    pkgsLatest.libGL 

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
