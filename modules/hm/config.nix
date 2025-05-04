{ lib, ... }:


{
    home.file = {
    	".config/nvim" = {
	    source = ./nvim;
	    recursive = true;
	};

    	".config/nvim/bobobo" = {
	    source = ./nvim/lua;
	    recursive = true;
	};

    	".config/nvim/lua/plugins" = {
	    source = ./nvim/lua/plugins;
	    recursive = true;
	};

    	".config/nvim/lua/config" = {
	    source = ./nvim/lua/config;
	    recursive = true;
	};

    	".config/hypr/userprefs.conf" = lib.mkForce {
	    source = ./hypr/userprefs.conf;
	};
    };

}
