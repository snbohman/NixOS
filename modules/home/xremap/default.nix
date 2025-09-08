{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        config = builtins.fromJSON (builtins.readFile ./config.json);
    };
}
