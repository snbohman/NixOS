{ pkgs, ... }:


{
    home.packages = with pkgs; [
        python3
        lf
        tree
        lazygit
        unzip
    ];
}
