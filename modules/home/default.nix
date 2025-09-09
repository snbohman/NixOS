{ ... }:
{
  imports = [
    ./bat.nix                         # better cat command
    ./browser                         # firefox browser
    ./btop.nix                        # resouces monitor 
    ./cava.nix                        # audio visualizer
    ./discord.nix                     # discord
    ./fastfetch.nix                   # fetch tool
    ./fzf.nix                         # fuzzy finder
    ./ghostty.nix                     # terminal
    ./git.nix                         # version control
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./lazygit.nix
    ./nemo.nix                        # file manager
    ./nix-search/nix-search.nix       # TUI to search nixpkgs
    ./nvim                            # neovim editor
    ./obsidian.nix                    # note manager
    ./p10k/p10k.nix                   # terminal style
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
