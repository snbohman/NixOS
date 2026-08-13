{ username, ... }:
{
    services = {
        xserver = {
            enable = true;

            xkb = {
                layout = "se";

                extraLayouts.custom_se = {
                    description = "Swedish - Coding";
                    symbolsFile = ./xkb/custom_se.xkb;
                    languages = [ "swe" ];
                };

                extraLayouts.MC = {
                    description = "MC";
                    symbolsFile = ./xkb/MC.xkb;
                    languages = [ "swe" ];
                };
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
