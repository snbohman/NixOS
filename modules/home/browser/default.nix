{ pkgs, ... }:
{
    home.packages = with pkgs; [
        firefox
    ];


    # home.file."mozilla/firefox/.." = {
    #     source = ./config;
    #     recursive = true;
    # };
}
