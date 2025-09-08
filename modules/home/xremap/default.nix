{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        withHypr = true;
        config = {
            keymap = [ {
                remap = {
                    CapsLock = "Esc";
                };
            } ];
        };
    };
}
