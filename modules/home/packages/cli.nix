{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    duf                               # disk information
    eza                               # ls replacement
    fd                                # find replacement
    hexyl                             # hex viewer
    man-pages                         # extra man pages
    ncdu                              # disk space
    ripgrep                           # grep replacement
    tldr			      # simplified man
    
    ## Monitoring / fetch
    htop

    ## Multimedia
    imv
    mpv

    ## Utilities
    ffmpeg
    file                              # Show file information
    jq                                # JSON processor
    killall
    openssl
    unzip
    wget
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
  ];
}
