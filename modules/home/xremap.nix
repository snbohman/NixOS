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
                    KEY_BACKSLASH = {
                        press = ["less"];                   # normal press -> <
                        "Shift-press" = ["greater"];        # Shift + press -> >
                        "RAlt-press" = ["asciitilde"];      # Right Alt + press -> ~
                        "Shift-RAlt-press" = ["bar"];       # Shift + Right Alt + press -> |
                    };
                };
            } ];
        };
    };
}
