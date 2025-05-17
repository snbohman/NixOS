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
