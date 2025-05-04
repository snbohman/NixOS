{ lib, ... }:


{
    home.file = {
    	".config/nvim" = {
	        source = ./nvim;
	        recursive = true;
	    };

        ".config/hypr/userprefs.conf" = lib.mkForce {
	        source = ./hypr/userprefs.conf;
	    };

        ".config/kitty/kitty.conf" = {
	        source = ./kitty/kitty.conf;
	    };

        ".zshrc" = {
	        source = ./zsh/zshrc;
	    };
    };
}
