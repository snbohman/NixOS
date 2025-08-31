{ inputs, pkgs, ... }:

{
    imports = [
        ./links.nix
        ./home.nix
        ./packages.nix
    ];
}
