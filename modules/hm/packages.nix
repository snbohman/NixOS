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

        xorg.setxkbmap
        xorg.xkbcomp
        xorg.xev

        uv
        python312
        numpy
        pillow
        scipy
    ];
}
