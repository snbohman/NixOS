{ username, ... }:
{
    services = {
        xserver = {
            enable = true;

            xkb = {
                layout = "se";

                extraLayouts.custom_se = {
                    name = "Se - Custom";
                    description = "Se - Custom";
                    symbolsFile = ./xkb/custom_se.xkb;
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
