{ inputs, pkgs, ... }:

{
    imports = [
        inputs.hydenix.lib.homeModules
        inputs.nix-index-database.hmModules.nix-index

        ./links.nix
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

    home.username = "snbohman";
    home.homeDirectory = "/home/snbohman";
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
}
