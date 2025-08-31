{
  description = "Dotfile template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hydenix = {
      url = "github:richen604/hydenix";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      # Define pkgs once, right here, using your overlays.
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ inputs.hydenix.lib.overlays (final: prev: {
            userPkgs = import nixpkgs {
              config.allowUnfree = true;
            };
          })
        ];
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        # Pass the unified 'pkgs' into your system configuration.
        specialArgs = { inherit inputs pkgs; };
        modules = [
          ./configuration.nix
        ];
      };

      homeConfigurations."snbohman" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; # Use the exact same 'pkgs' for home-manager.
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./modules/hm ];
      };
    };
}
