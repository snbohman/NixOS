{ ... }:
let
  custom = {
    font = "Maple Mono";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#FBF1C7";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#A89984";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#458588";
    magenta = "#B16286";
    cyan = "#689D6A";
    orange = "#D65D0E";
    orange_bright = "#FE8019";
    opacity = "1";
    indicator_height = "2px";
  };
in
{
  programs.waybar.style = with custom; ''
    * {
      border: none;
      border-radius: 0px;
      padding: 0;
      margin: 0;
      font-family: ${font};
      font-weight: ${font_weight};
      opacity: ${opacity};
      font-size: ${font_size};
    }
    window#waybar {
      background: transparent;
    }
    tooltip {
      background: ${background_1};
      border: 1px solid ${border_color};
    }
    tooltip label {
      margin: 5px;
      color: ${text_color};
    }
    .modules-left,
    .modules-center,
    .modules-right {
      border-bottom: ${indicator_height} solid ${border_color};
      padding-bottom: 2px;
    }
    #workspaces {
      padding-left: 15px;
    }
    #workspaces button {
      color: ${yellow};
      padding-left:  5px;
      padding-right: 5px;
      margin-right: 10px;
    }
    #workspaces button.empty {
      color: ${text_color};
    }
    #workspaces button.active {
      color: ${orange_bright};
    }
    #clock {
      color: ${text_color};
    }
    #tray {
      margin-left: 10px;
      color: ${text_color};
    }
    #tray menu {
      background: ${background_1};
      border: 1px solid ${border_color};
      padding: 8px;
    }
    #tray menuitem {
      padding: 1px;
    }
    #pulseaudio, #cpu, #memory, #disk, #battery, #language, #custom-notification {
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 10px;
      color: ${text_color};
    }
    #pulseaudio, #language {
      margin-left: 15px;
    }
    #custom-notification {
      margin-left: 15px;
      padding-right: 2px;
      margin-right: 5px;
    }
  '';
}
