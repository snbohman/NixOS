{ ... }:

{
    imports = [
        ./config.nix
        ./deactivations.nix
        ./packages.nix
    ];

    hydenix.hm.enable = true;
}
