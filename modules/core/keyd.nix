{ pkgs, ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            # Swedish layout
            # q = "q"; w = "w"; e = "e"; r = "r"; t = "t"; y = "y"; u = "u"; i = "i"; o = "o"; p = "p"; a = "a"; s = "s"; d = "d"; f = "f"; g = "g"; h = "h"; j = "j"; k = "k"; l = "l"; z = "z"; x = "x"; c = "c"; v = "v"; b = "b"; n = "n"; m = "m";

            # Swap a and b in the 'testing' layer
            A-k = "layer(testing)";
          };
          testing = {
            a = "b";
          };
        };
      };
    };
  };
}
