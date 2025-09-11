{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    gimp
    soundwireserver
    vlc

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor
  ];
}
