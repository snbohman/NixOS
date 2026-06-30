{ ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      cdf_widget() {
        zle push-line
        BUFFER="cdf"
        zle accept-line
      }

      zle -N cdf_widget
      bindkey '^G' cdf_widget

      # Tab accepts the autosuggestion
      bindkey '^I' autosuggest-accept
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
