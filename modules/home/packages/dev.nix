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
    zig


    # language servers
    zls
    nixd
    lua-language-server 


    ## Python
    python311
    uv
  ];
}
