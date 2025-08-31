{ inputs, pkgs, ... }:

{
    imports = [
        inputs.hydenix.lib.homeModules
        inputs.nix-index-database.homeModules.nix-index

        ./links.nix
        ./deactivations.nix
        ./home.nix
        ./packages.nix
    ];
}
