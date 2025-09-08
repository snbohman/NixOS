{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        withHypr = true;
        config = {
            devices = [ {
                input = "usb-BY_Tech_Gaming_Keyboard-event-kbd";
            } ]

            keymap = [ {
                remap = {
                    CapsLock = "Esc";
                };
            } ];
        };
    };
}
