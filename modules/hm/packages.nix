{ pkgs, ... }:


{
    home.packages = with pkgs; [
        go
        cargo
        python3
        lf
        tree
        lazygit
    ];
}
