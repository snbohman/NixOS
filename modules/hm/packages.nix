{ pkgs, ... }:


{
    home.packages = with pkgs; [
        lf
        tree
        lazygit
        unzip

        tmux
        tpm

        premake5
        clang-tools
        clang
    ];
}
