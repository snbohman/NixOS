{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultOptions = [
      "--height=100%"
      "--layout=reverse"
      "--border=double"
      "--preview-window=border-sharp"

      "--color=fg:-1,fg+:#FBF1C7,bg:-1,bg+:#282828"
      "--color=hl:#98971A,hl+:#B8BB26,info:#928374,marker:#D65D0E"
      "--color=prompt:#CC241D,spinner:#689D6A,pointer:#D65D0E,header:#458588"
      "--color=border:#665C54,label:#aeaeae,query:#FBF1C7"

      "--prompt='> '"
      "--marker='>'"
      "--pointer='>'"
      "--separator='─'"
      "--scrollbar='│'"
      "--info=right"
    ];
  };

  programs.zsh = {
    enable = true;

    initExtra = ''
      # Ctrl-G: recursive directory search + cd
      fzf-dir-widget() {
        local dir
        dir=$(fd \
          --type d \
          --hidden \
          --strip-cwd-prefix \
          --exclude .git |
          fzf) || return

        cd "$dir"
        zle reset-prompt
      }

      # Ctrl-H: recursive file search
      fzf-file-widget() {
        local file
        file=$(fd \
          --type f \
          --hidden \
          --strip-cwd-prefix \
          --exclude .git |
          fzf) || return

        BUFFER="$file"
        CURSOR=''${#BUFFER}
      }
      fzf-nvim-widget() {
        local dir
        dir=$(fd \
          --type d \
          --hidden \
          --strip-cwd-prefix \
          --exclude .git |
          fzf) || return

        cd "$dir" || return
        nvim .
        zle reset-prompt
      }

      zle -N fzf-dir-widget
      zle -N fzf-file-widget
      zle -N fzf-nvim-widget

      bindkey '^G' fzf-dir-widget
      bindkey '^H' fzf-file-widget
      bindkey '^N' fzf-nvim-widget
    '';
  };
}
