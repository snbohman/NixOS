{ lib, pkgs, config, ... }:

{
    home.file = {
    	".config/nvim" = {
	        source = ./config/nvim;
	        recursive = true;
	    };

        ".config/hypr/userprefs.conf" = lib.mkForce {
	        source = ./config/hypr/userprefs.conf;
	    };

        ".config/hypr/keybindings.conf" = lib.mkForce {
	        source = ./config/hypr/keybindings.conf;
	    };

        ".zshrc" = {
	        source = ./config/zsh/zshrc;
	    };

        ".config/kitty/kitty.conf" = {
	        source = ./config/kitty/kitty.conf;
	    };

        ".mozilla/firefox/q8pmdenq.default/chrome" = {
            source = ./config/firefox;
            recursive = true;
        };

        ".gitconfig" = {
            source = ./config/git/gitconfig;
        };
    };

    programs.tmux = {
        enable = true;
        plugins = [ ];
        extraConfig = builtins.readFile ./config/tmux/tmux.conf;
    };
}
