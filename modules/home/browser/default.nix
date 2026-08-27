{ pkgs, ... }:
{
    home.packages = with pkgs; [
        firefox
    ];

    home.file.".mozilla/firefox/krwoay8v.default/chrome" = {
        source = ./chrome;
        recursive = true;
    };
}
