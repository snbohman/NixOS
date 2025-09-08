{ pkgs, inputs, ... }:

{
    imports = [
        inputs.xremap.homeManagerModules.default
    ];

    services.xremap = {
        enable = true;
        withHypr = true;

        config = {
            modmap = [ {
                name = "Bracket Remap";
                remap = {
                    KEY_LEFTBRACE = "LeftBrace";
                    KEY_RIGHTBRACE = "RightBrace";
                };
            } ];

            keymap = [ {
                name = "Custom Symbols Key";
                remap = {
                    KEY_BACKSLASH = "less";
                    "Shift-KEY_BACKSLASH" = "greater";
                    "RAlt-KEY_BACKSLASH" = "asciitilde";
                    "Shift-RAlt-KEY_BACKSLASH" = "bar";
                };
            } ];
        };
    };
}
