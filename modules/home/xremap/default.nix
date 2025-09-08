{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        withHypr = true;
        extraArgs = [
            "--device"
            "/dev/input/by-id/usb-BY_Tech_Gaming_Keyboard-event-kbd"
        ];

        config = {

            keymap = [ {
                remap = {
                    CapsLock = "Esc";
                };
            } ];
        };
    };
}
