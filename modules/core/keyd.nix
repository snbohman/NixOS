{ pkgs, ... }:
{
    services.keyd.enable = true;
    environment.etc."keyd/default.conf".text = ''
        [ids]
        * 

        [main]
        layout = se

        [super+k]
        a = b
    '';
}
