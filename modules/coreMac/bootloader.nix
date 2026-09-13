{ pkgs, ... }:
{
  boot.loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 5;
      useOSProber = true;
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = [ "ext4" "btrfs" "vfat" "ntfs" ];
}
