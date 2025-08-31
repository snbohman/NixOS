{ ... }:

{
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

        social.enable = false;
        waybar.enable = false;
        dolphin.enable = false;
        spotify.enable = false;
        editors.vscode.enable = false;
        shell.pokego.enable = false;
    };
}
