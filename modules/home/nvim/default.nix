{ pkgs, inputs, ... }:
let
  pkgsLatest = import inputs.nixpkgs-latest {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
  python3WithPynvim = pkgsLatest.python3.withPackages (ps: [ ps.pynvim ]);
  neovimWithPython = pkgsLatest.neovim.override {
    withPython3 = true;
    extraPython3Packages = ps: [ ps.pynvim ];
  };
in {
  home.packages = [
    neovimWithPython
    python3WithPynvim
  ];
home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}
