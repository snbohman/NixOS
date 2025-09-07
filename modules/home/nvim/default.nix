{ ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}
