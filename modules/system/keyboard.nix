{ lib, pkgs, services, ... }:

{
    services.xserver.xkb.extraLayouts.seCustom = {
        description = "Swedish (Custom)";
        symbols = builtins.readFile ./xkb/swedishCustom;
    };
}
