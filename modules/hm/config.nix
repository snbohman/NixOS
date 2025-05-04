{
    home.file {
    	".config/nvim" = {
	    source = ./nvim;
	    recursive = true;
	};

    	".config/hypr/userprefs.conf" = {
	    source = ./hypr/userprefs.conf
	};
    }

}
