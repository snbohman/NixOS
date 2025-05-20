{
  description = "Dotfile template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hydenix.url = "github:richen604/hydenix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, hydenix, home-manager, ... }@inputs:
    let
      HOSTNAME = "hydenix";
      USERNAME = "snbohman";

      hydenixConfig = hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
        inherit inputs;
        modules = [
          ./configuration.nix
        ];
      };
    in
    {
      nixosConfigurations.nixos = hydenixConfig;
      nixosConfigurations.${HOSTNAME} = hydenixConfig;

      homeConfigurations.${USERNAME} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${systemArch};
        modules = [
          ./modules/hm
        ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
