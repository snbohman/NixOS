{ lib, pkgs, config, ... }:

{
    home.file = {
    	".config/nvim" = {
	        source = ./config/nvim;
	        recursive = true;
	    };

        ".zshrc" = lib.mkForce {
	        source = ./config/zsh/zshrc;
	    };

        ".mozilla/firefox/q8pmdenq.default/chrome" = {
            source = ./config/firefox;
            recursive = true;
        };

        ".gitconfig" = {
            source = ./config/git/gitconfig;
        };
    };
}
