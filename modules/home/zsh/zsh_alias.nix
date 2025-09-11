{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      cd = "z";
      code = "codium";
      diff = "delta --diff-so-fancy --side-by-side";
      f = "superfile";
      py = "python";
      pdf = "tdf";
      open = "xdg-open";
      space = "ncdu";

      # Nixos
      cdnix = "cd ~/NixOS && nvim ~/NixOS";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # Shorts
      v = "nvim";
      x = "exit";
      md = "mkdir";
      lg = "lazygit";
    };
  };
}
