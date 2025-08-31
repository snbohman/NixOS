{
  description = "Dotfile template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hydenix.url = "github:richen604/hydenix";
    # Nix-index-database - for comma and command-not-found
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { ... }@inputs:
    let
      HOSTNAME = "hydenix";
      hydenixConfig = inputs.hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
        inherit (inputs.hydenix.lib) system;
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

      homeConfigurations.snbohman = inputs.hydenix.inputs.home-manager.lib.homeManagerConfiguration {
        inherit (inputs.hydenix.lib) system;
        modules = [
          ./modules/hm
          inputs.nix-index-database.hmModules.nix-index
        ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
}
