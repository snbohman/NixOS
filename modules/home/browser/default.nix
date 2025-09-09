{ pkgs, ... }:
{
    home.packages = with pkgs; [
        firefox
    ];

    home.file.".mozilla/firefox/zmgc4d68.default/chrome" = {
        source = ./chrome;
        recursive = true;
    };
}
