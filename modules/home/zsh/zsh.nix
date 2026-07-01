{ ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    completionInit = ''
      autoload -U compinit
      compinit
    '';

    initContent = ''
      if [[ -n "$IN_NIX_DEV_SHELL" ]]; then
        PROMPT="[dev] $PROMPT"
      fi

      cdf_widget() {
        zle push-line
        BUFFER="cdf"
        zle accept-line
      }

      zle -N cdf_widget
      bindkey '^G' cdf_widget

      nv() {
        local f
        f=$(mktemp)
        cat > "$f"
        nvim "$f"
        rm -f "$f"
      }
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
