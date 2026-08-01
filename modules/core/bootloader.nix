{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.compressor = "xz";
  boot.supportedFilesystems = [ "ext4" "btrfs" "vfat" "ntfs" ];
}
