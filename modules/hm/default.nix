{
    imports = [
        ./config.nix
        ./deactivations.nix
        ./packages.nix
    ];

    hydenix.hm = {
        enable = true;

        editors.default = "neovim";

        git.enable = true;
        git.name = "snbohman";
        git.email = "sixten.bohman.08@gmail.com";
        git.credentialHelper = "manager-core"

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
