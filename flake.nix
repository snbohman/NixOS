{
  description = "Dotfile template";

  inputs = {
    nixpkgs.url = "github.com:nixos/nixpkgs/nixos-unstable";

    hydenix.url = "github.com:richen604/hydenix";

    home-manager = {
      url = "github.com:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github.com:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, hydenix, home-manager, ... }@inputs:
    let
      HOSTNAME = "hydenix";
      USERNAME = "snbohman";
      systemArch = "x86_64-linux";

      hydenixConfig = hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
        inherit systemArch;
        specialArgs = {
          inherit inputs;
        };
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
