{ ... }:
{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
  ];
}
