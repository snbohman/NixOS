{ username, ... }:
{
  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "se";
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
