{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    htop

    ## Multimedia
    imv
    mpv

    ## Utilities
    ffmpeg
    jq
    openssl
    unzip
    wget
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
  ];
}
