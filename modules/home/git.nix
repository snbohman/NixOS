{ pkgs, username, ... }:
{
  programs.git = {
    enable = true;

    userName = "snbohman";
    userEmail = "sixten.bohman.08@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      core.excludesFile = "/home/${username}/.config/git/.gitignore";

      url = {
       "git@github.com:".insteadOf = [
         "gh:"
         "https://github.com/"
       ];
       "git@github.com:snbohman/".insteadOf = "sn:";
       "git@github.com-work:MagInteractive-AB/".insteadOf = "mag:";
      };

      includeIf."gitdir:~/work/".path = "~/.config/git/config-work";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = false;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

  home.packages = [ pkgs.gh ]; # pkgs.git-lfs

  xdg.configFile."git/.gitignore".text = ''
    .vscode
  '';

  xdg.configFile."git/config-work".text = ''
    [user]
        name = sixten-mag
        email = sixten.bohman@maginterative.se
    [core]
        sshCommand = "ssh -i ~/.ssh/id_github_work"
  '';

  programs.zsh.shellAliases = {
    ga = "git add --all;";
    gc = "git commit -m";
    gp = "git push";
    gs = "git status;";
  };
}
