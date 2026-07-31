{ pkgs, inputs, ... }:
let
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
  neovimWithPython = pkgsLatest.neovim.override {
    extraPython3Packages = ps: [ ps.pynvim ];
  };
in {
  home.packages = [
    neovimWithPython
  ];
  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}
