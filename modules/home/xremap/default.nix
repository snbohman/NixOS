{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap-flake.homeManagerModules.default
    ];

    programs.xremap = {
        enable = true;
        config = builtins.fromJSON (builtins.readFile ./config.json);
    };
}
