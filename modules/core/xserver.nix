{ username, ... }:
{
  services = {
    xserver = {
      enable = true;

      extraLayouts = {
        se = {
          description = "Swedish [code]";
          languages = [ "sv" ];
          symbolsFile = xkb/se;
        };
      };

      layout = "se,se";
      variant = ",custom";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };

    libinput = {
      enable = true;
    };
  };

  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
