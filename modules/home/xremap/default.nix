{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        withHypr = true;
        deviceNames = [ "BY Tech Gaming Keyboard" ];
        config = import ./mapping.nix;
    };
}
