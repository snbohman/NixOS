{
  inputs,
  ...
}:
let
  pkgs = import inputs.hydenix.inputs.hydenix-nixpkgs {
    inherit (inputs.hydenix.lib) system;
    config.allowUnfree = true;
    overlays = [
      inputs.hydenix.lib.overlays
      (final: prev: {
        userPkgs = import inputs.nixpkgs {
          config.allowUnfree = true;
        };
      })
    ];
  };
in
{

  nixpkgs.pkgs = pkgs;

  imports = [
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    inputs.hydenix.lib.nixOsModules
    ./modules/system

    # === GPU-specific configurations ===
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];


  ############ NVIDIA SPECIALIZATION #############
  hardware.nvidia.open = false;
  hardware.nvidia.prime.sync.enable = false;
  hardware.nvidia.prime.offload.enable = false;
  ################################################

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
    };

    users."snbohman" =
      { ... }:
      {
        imports = [
          inputs.hydenix.lib.homeModules
          inputs.nix-index-database.hmModules.nix-index
          ./modules/hm
        ];
      };
  };

  hydenix = {
    enable = true;

    hostname = "nixos";
    timezone = "Europe/Stockholm";
    locale = "en_US.UTF-8";

    boot.useSystemdBoot = false;
  };

  users.users.snbohman = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];

    shell = pkgs.zsh;
  };

  system.stateVersion = "25.05";
}
