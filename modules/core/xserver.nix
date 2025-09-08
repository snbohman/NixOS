{ username, ... }:
{
    services = {
        xserver = {
            enable = true;

            xkb = {
                layout = "se";
            };

            extraLayouts.custom_se = {
                description = "Swedish - Custom";
                symbolsFile = ./xkb/ccustom_se.xkb;
                languages = [ "swe" ];
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
