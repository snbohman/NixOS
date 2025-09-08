{ pkgs, ... }:

{
    imports = [
        inputs.nix-flake.homeManagerModules.default
    ];

    programs.xremap = {
        enable = true;
        config = builtins.fromJSON (builtins.readFile ./config.json);
    };
}
