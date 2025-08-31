{ pkgs, ... }:


{
    home.packages = with pkgs; [
        lf
        tree
        lazygit
        unzip

        tmux

        premake5
        clang-tools
        clang

        uv
        python312

        obsidian
    ];
}
