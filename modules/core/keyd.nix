{ pkgs, ... }:
{
    services.keyd.enable = true;
    enviroment.etc."keyd/default.conf".text = ''
        [ids]
        * 

        [main]
        layout = se

        [super+k]
        a = b
    '';
}
