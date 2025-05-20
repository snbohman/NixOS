{ config, pkgs, ... }:

{
    services.xserver.xkb = {
        extraLayouts."seCustom" = {
            languages = [ "swe" ];
            description = "Swedish (Custom)";
            symbolsFile = ./xkb/swedishCustom;
        };

        layout = "se, seCustom";
    };
}
