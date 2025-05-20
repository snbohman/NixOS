{ lib, pkgs, services, ... }:

{
    services.xserver.xkb = {
        layout = "se";
        extraLayouts = {
            "seCustom" = {
                description = "Swedish (Custom)";
                symbolsFile = ./xkb/swedishCustom;
            };
        };

        layout = "se, seCustom";
    };
}
