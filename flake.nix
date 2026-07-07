{
  description = "Snbohman's nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs = {
        hyprland = {
          follows = "hyprland";
        };
      };
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    odin-nightly = {
        url = "github:Yappaholic/odin-nightly";
        inputs.nixpgks.follows = "nixpkgs";
    };    

    zig-overlay = {
        url = "github:mitchellh/zig-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    zls = {
        url = "github:zigtools/zls";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {

      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      username = "snbohman";
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        primary = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/primary ];
          specialArgs = {
            host = "primary";
            inherit self inputs username;
          };
        };
        secondary = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/secondary ];
          # modules = [ (nixpkgs.overlays = [inputs.odin-nightly.overlays.default]) ];
          specialArgs = {
            host = "secondary";
            inherit self inputs username;
          };
        };
      };
    };
}
