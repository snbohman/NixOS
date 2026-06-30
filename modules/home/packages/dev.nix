{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    ## C / C++
    clang
    cmake
    gnumake
    premake5
    bear
    inputs.zig-overlay.packages.${pkgs.system}.master

    # language servers
    zls
    nixd
    lua-language-server 
    llvmPackages_20.clang-tools


    ## Python
    python311
    uv
  ];
}
