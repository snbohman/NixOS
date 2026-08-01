{ pkgs, inputs, ... }:
let
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
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

    zsteg

    evsieve
    hello
  ];
}
