{ username, ... }:
{
  services = {
    xserver = {
      enable = true;

      extraLayouts.se = {
        description = "Swedish with custom programming variant";
        languages = [ "sv" ];
        symbolsFile = ./xkb/se;
      };

      xkb = {
        layout = "se";
        variant = ",custom";
        options = "grp:alt_caps_toggle,lv3:alt_switch";
      };
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
