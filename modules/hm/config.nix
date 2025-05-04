{ lib, ... }:


{
    home.file = {
    	".config/nvim" = {
	    recursive = true;
	    source = ./nvim/;
	};

    	".config/hypr/userprefs.conf" = lib.mkForce {
	    source = ./hypr/userprefs.conf;
	};
    };

}
