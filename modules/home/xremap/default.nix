{ pkgs, ... }:

{
    programs.xremap = {
        enable = true;
        config = builtins.fromJSON (builtins.readFile ./config.json);
    };
}
