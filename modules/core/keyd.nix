{ pkgs, ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            super-k = "layer(testing)";
          };
          testing = {
            a = "b";
          };
        };
      };
    };
  };
}
