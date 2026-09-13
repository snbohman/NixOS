{ pkgs, ... }:
{
    home.packages = with pkgs; [
        firefox
    ];

    home.file.".mozilla/firefox/vfpjcrpn.default/chrome" = {
        source = ./chrome;
        recursive = true;
    };
}
