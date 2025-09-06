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

      options = "grp:alt_caps_toggle";
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
