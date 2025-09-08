{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    programs.xremap = {
        enable = true;
        config = builtins.fromJSON (builtins.readFile ./config.json);
    };
}
