{
    description = "Snbohman's dotfiles";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./hardware-configuration.nix
                ./modules/system
                home-manager.nixosModules.home-manager
            ];
        };
    };
}
