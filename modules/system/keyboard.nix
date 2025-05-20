{ config, pkgs, ... }: {
    services.xserver.xkb = {
        layout = "se";
        xkbOptions = "seCustom:basic";

        extraLayouts."seCustom" = {
            languages = [ "swe" ];
            description = "Swedish (Custom)";
            symbolsFile = ./xkb/swedishCustom;
        };
    };
}
