{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    htop

    ## Multimedia
    imv
    mpv
    mupdf

    ## Utilities
    ffmpeg
    jq
    fd
    openssl
    unzip
    wget
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
    imagemagick
  ];
}
