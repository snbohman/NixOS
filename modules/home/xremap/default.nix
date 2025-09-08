{ pkgs, ... }:

{
    home.packages = with pkgs; [
        xremap
    ];

    programs.xremap = {
        enable = true;
        config = ./config.json;
    };

    home.file.".config/xremap/config.json" = {
        source = ./config.json;
    };
}
