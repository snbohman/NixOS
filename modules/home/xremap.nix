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
                    KEY_BACKSLASH = ["Shift" "Comma"];
                    "Shift-KEY_BACKSLASH" = ["Shift" "Period"];
                    "RAlt-KEY_BACKSLASH" = ["Shift" "Grave"];
                    "Shift-RAlt-KEY_BACKSLASH" = ["Shift" "Backslash"];
                };
            } ];
        };
    };
}
