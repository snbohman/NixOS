{ pkgs, ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = ''
            [ids]
            *
    
            meta-k = layer(testing)

            [testing]
            a = b
        '';
      };
    };
  };
}
