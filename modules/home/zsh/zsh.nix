{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    completionInit = ''
      autoload -U compinit
      compinit
    '';

    initContent = ''
      # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
      _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
      }

      _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
      }

      cdf_widget() {
        zle push-line
        BUFFER="cdf"
        zle accept-line
      }

      zle -N cdf_widget
      bindkey '^G' cdf_widget
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
