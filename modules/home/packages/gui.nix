{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    gimp
    obs-studio
    pavucontrol
    soundwireserver
    video-trimmer
    vlc

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor
    zenity
  ];
}
