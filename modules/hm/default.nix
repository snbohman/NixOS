{ ... }:

{
    imports = [
        ./config.nix
    ];

    home.packages = [
        pkgs.go
    ];

    hydenix.hm = {
        enable = true;

        social.enable = false;
        waybar.enable = false;

        editors.vscode.enable = false;
        editors.default = "neovim";

        git.name = "snbohman";
        git.email = "sixten.bohman.08@gmail.com";

        shell.pokego.enable = false;

        theme = {
	        active = "Gruvbox Retro";
	        themes = [
	            "Gruvbox Retro"
	            "Dracula"
	            "Monokai"
	            "One-Dark"
    	    ];
        };
    };
}
