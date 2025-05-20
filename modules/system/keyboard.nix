{ lib, pkgs, services, ... }:

{
    services.xserver.xkb.extraLayouts.seCustom = {
        description = "Swedish (Custom)";
        languages = "eng";
        symbolsFile = ./xkb/swedishCustom;
    };
}
