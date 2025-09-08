{ pkgs, ... }:

{
    home.packages = with pkgs; [
        xremap
    ];

    programs.xremap = {
        enable = true;
        config = ./config.json;
    };
}
