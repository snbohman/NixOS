{ pkgs, inputs, ... }:
let
  mcsrPkgs = inputs.mcsr-nixos.packages.${pkgs.stdenv.hostPlatform.system};
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

    prismlauncher
    waywall
    mcsrPkgs.ninjabrain-bot
  ];
}
