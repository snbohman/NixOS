{ ... }:


{
    hydenix.hm.xdg.configFile = {
    	"hypr/userprefs.conf" = {
    	    source = "~/dotfiles/hypr/userprefs.conf";
    	}

    	"nvim" = {
    	    source = "~/dotfiles/nvim";
	    recursive = true;
    	}
    }
}
