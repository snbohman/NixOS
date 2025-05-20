{ lib, pkgs, services, ... }:

{
    services.xserver.xkb = {
        extraLayouts = {
            "seCustom" = {
                description = "Swedish (Custom)";
                symbolsFile = ./xkb/swedishCustom;
            };
        };

        layout = "se, seCustom";
    };
}
