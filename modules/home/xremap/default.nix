{ pkgs, ... }:

{
    home.packages = with pkgs; [
        xremap
    ];

    home.file.".config/xremap/config.json" = {
        source = ./config.json;
    };
}
