{ config, pkgs, ... }: {
    services.xserver.xkb = {
        layout = "se";
        options = "seCustom:basic";

        extraLayouts."seCustom" = {
            languages = [ "swe" ];
            description = "Swedish (Custom)";
            symbolsFile = ./xkb/swedishCustom;
        };
    };
}
