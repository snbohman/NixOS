{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # utils
      cd = "z";
      diff = "delta --diff-so-fancy --side-by-side";
      f = "superfile";
      py = "python";
      open = "xdg-open";

      # edit dotfiles 
      edf = "cd ~/.dotfiles && v ~/.dotfiles";


      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # shorts
      v = "nvim";
      x = "exit";
      md = "mkdir";
      lg = "lazygit";
      vt = "NVIM_APPNAME=nvim-test nvim";
      vimt = "NVIM_APPNAME=nvim-test nvim";

      ":r" = "| nv";
    };
  };
}
