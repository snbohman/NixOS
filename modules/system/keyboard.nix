{ lib, pkgs, services, ... }:

{
    services.xserver.xkb.extraLayouts.seCustom = {
        description = "Swedish (Custom)";
        languages = "se";
        symbolsFile = ./xkb/swedishCustom;
    };
}
