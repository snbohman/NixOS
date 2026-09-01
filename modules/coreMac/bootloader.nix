{ pkgs, ... }:
let
  outer-wilds-grub = pkgs.stdenv.mkDerivation {
    pname = "outer-wilds-grub-theme";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "Terofale";
      repo = "outer-wilds-grub-theme";
      rev = "main";

      # Fill this in with the hash Nix gives you.
      hash = "sha256-XPVUbNzR8DIIJLdw7yQ9jNekJwerXVm55fvNAxfW1jQ=";
    };

    installPhase = ''
      mkdir -p $out
      cp -r theme-files-1080p/* $out/
    '';
  };
in
{
  boot.loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 5;
      useOSProber = true;
      theme = outer-wilds-grub;
      gfxmodeEfi = "1920x1080,auto";
      gfxmodeBios = "1920x1080,auto";
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = [ "ext4" "btrfs" "vfat" "ntfs" ];
}
