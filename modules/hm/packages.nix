{ pkgs, ... }:


{
    home.packages = with pkgs; [
        lf
        tree
        lazygit
        unzip
        tmux
        git-credential-manager
    ];
}
