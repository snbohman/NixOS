{ ... }:
{
    services.keyd.enable = true;
    environment.etc."keyd/default.conf".text = ''
        [ids]
        * 

        [main]
        layout = se
        super+k = layer(test);

        [super+k]
        a = b
    '';
}
