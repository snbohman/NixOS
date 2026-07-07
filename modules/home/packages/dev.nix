{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    ## c
    clang
    cmake
    gnumake
    premake5
    bear

    # zig
    inputs.zig-overlay.packages.${pkgs.system}.master
    inputs.zls.packages.${pkgs.system}.zls

    # odin
    odin
    ols

    ## Python
    python311
    uv

    # language servers
    nixd
    lua-language-server 
    llvmPackages_20.clang-tools
  ];
}
