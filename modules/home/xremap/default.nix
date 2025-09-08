{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        withHypr = true;
        userName = "snbohman";

        config = {
            keymap = [
                {
                    name = "testing";
                    remap = {
                        CapsLock = "Esc";
                    };
                }
            ];
        };
    };
}
