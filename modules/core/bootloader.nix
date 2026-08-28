{ pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.configurationLimit = 5;
  boot.loader.grub.useOSProber = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = [ "ext4" "btrfs" "vfat" "ntfs" ];
}
