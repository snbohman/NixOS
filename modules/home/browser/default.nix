{ pkgs, ... }:
{
    home.packages = with pkgs; [
        firefox
    ];

    home.file.".mozilla/firefox/5ehozca5.default/chrome" = {
        source = ./chrome;
        recursive = true;
    };
}
