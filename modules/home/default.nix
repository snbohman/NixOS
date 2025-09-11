{ ... }:
{
  imports = [
    ./browser                         # firefox browser
    ./btop.nix                        # resouces monitor 
    ./fzf.nix                         # fuzzy finder
    ./ghostty.nix                     # terminal
    ./git.nix                         # version control
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./lazygit.nix
    ./nemo.nix                        # file manager
    ./nvim                            # neovim editor
    ./obsidian.nix                    # note manager
    ./packages                        # other packages
    ./rofi.nix                        # launcher
    ./scripts/scripts.nix             # personal scripts
    ./ssh.nix                         # ssh config
    ./superfile/superfile.nix         # terminal file manager
    ./swaylock.nix                    # lock screen
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./vscodium                        # vscode fork
    ./waybar                          # status bar
    ./waypaper.nix                    # GUI wallpaper picker
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
  ];
}
