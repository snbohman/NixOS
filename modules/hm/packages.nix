{ pkgs, ... }:


{
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        lf
        tree
        lazygit

	nvim
	alacritty
	rofi
        unzip

        tmux

        premake5
        clang-tools
        clang

        uv
        python312

        obsidian
    ];
}
