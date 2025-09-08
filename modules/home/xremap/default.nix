{ pkgs, ... }:

{
    services.xremap = {
        enable = true;
        config = ./config.json;
    };
}
