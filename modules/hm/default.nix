{ inputs, pkgs, ... }:

{
    imports = [
        inputs.hydenix.lib.homeModules
        inputs.nix-index-database.homeModules.nix-index

        ./links.nix
        ./hydenix.nix
        ./home.nix
        ./packages.nix
    ];
}
