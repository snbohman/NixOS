{ pkgs, inputs, ... }:
let
  mcsrPkgs = inputs.mcsr-nixos.packages.${pkgs.stdenv.hostPlatform.system};
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    ## Multimedia
    gimp
    soundwireserver
    vlc

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor

    obs-studio

    pkgsLatest.prismlauncher
    pkgsLatest.waywall
    mcsrPkgs.ninjabrain-bot
  ];
}
