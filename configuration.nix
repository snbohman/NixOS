{
  inputs,
  pkgs,
  ...
}:
{

  nixpkgs.pkgs = pkgs;

  imports = [
    ./hardware-configuration.nix
    inputs.hydenix.lib.nixOsModules
    ./modules/system

    # === GPU-specific configurations ===
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc-ssd

  ];

  hardware.nvidia.open = false;
  hardware.nvidia.prime.sync.enable = false;
  hardware.nvidia.prime.offload.enable = false;

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
