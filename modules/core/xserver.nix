{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "se,se_custom";
        options = "grp:alt_caps_toggle";
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
