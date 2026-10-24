{ config, pkgs, inputs, ... }:
let
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };

  neovimWithPython = pkgsLatest.neovim.override {
    withPython3 = true;
    extraPython3Packages = ps: [ ps.pynvim ];
    wrapRc = false;
    configure.packages.nixPlugins.start = with pkgsLatest.vimPlugins; [
      cpsm
      wilder-nvim
    ];
  };

  nvimDir = "${config.home.homeDirectory}/.config/nixos/modules/home/nvim/config";
in {
  home.packages = [
    neovimWithPython
  ];

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvimDir;
}
