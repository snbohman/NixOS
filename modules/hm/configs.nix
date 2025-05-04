{ ... }:


{
    hydenix.hm = {
    	xdg.configFile."hypr/userprefs.conf" = {
    	    source = "~/dotfiles/hypr/userprefs.conf";
    	}

    	xdg.configFile."nvim" = {
    	    source = "~/dotfiles/nvim";
	    krecursive = true;
    	}
    }
}
