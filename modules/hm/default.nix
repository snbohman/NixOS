{ pkgs, ... }:

{
    imports = [
        ./config.nix
        ./deactivations.nix
        ./packages.nix
    ];

    hydenix.hm = {
        enable = true;

        editors.default = "neovim";

        git = {
            enable = true;
            name = "snbohman";
            email = "sixten.bohman.08@gmail.com";

            package = pkgs.gitFull;
            config.credential.helper = "libsecret";
        };


        theme = {
	        active = "Gruvbox Retro";
	        themes = [
	            "Gruvbox Retro"
	            "Dracula"
	            "Monokai"
                "Greenify"
                "Nordic Blue"
                "One Dark"
                "Rain Dark"
    	    ];
        };
    };
}
