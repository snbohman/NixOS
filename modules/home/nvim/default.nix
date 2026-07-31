{ pkgs, inputs, ... }:
let
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
  	pkgsLatest.neovim
    pkgsLatest.python3Packages.pynvim
  ];

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}
