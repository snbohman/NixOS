{ config, pkgs, ... }:

{
    services.xserver.xkb = {
        extraLayouts = {
            "seCustom" = {
                languages = [ "se" ];
                description = "Swedish (Custom)";
                symbolsFile = ./xkb/swedishCustom;
            };
        };

        layout = "se, seCustom";
    };
}
