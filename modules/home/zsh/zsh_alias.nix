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

      # edit .config/nixos 
      edf = "cd ~/.config/nixos && v ~/.config/nixos; cd -";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # shorts
      v = "nvim";
      x = "exit";
      md = "mkdir";
      lg = "lazygit";
      ls = "ls -la --color --group-directories-first";
    };

    shellGlobalAliases = {
      RR = "| nv";
    };
  };
}
