{ username, ... }:
{
  services = {
    xserver = {
      enable = true;

      extraLayouts.se_custom = {
        description = "Swedish Custom";
        languages   = [ "sv" ];
        symbolsFile = ./xkb/se_custom;
      };

      xkb = {
        layout = "se,se_custom";
      	options = "grp:alt_caps_toggle,lv3:alt_switch";
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
