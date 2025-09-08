{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        withHypr = true;
        deviceNames = [ "usb-BY_Tech_Gaming_Keyboard-event-kbd" ];
        config = import ./mapping.nix;
    };
}
