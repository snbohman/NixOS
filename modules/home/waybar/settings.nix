{ host, ... }:
let
  custom = {
    font = "Maple Mono";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#FBF1C7";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#928374";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#458588";
    magenta = "#B16286";
    cyan = "#689D6A";
    orange = "#D65D0E";
    indicator_height = "2px";
  };
in
{
  programs.waybar.settings.mainBar = with custom; {
    position = "top";
    layer = "top";
    height = 20;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "hyprland/workspaces"
    ];
    modules-center = [ "clock" ];
    modules-right = [
      "cpu"
      "memory"
      "disk"
      "hyprland/language"
    ];
    clock = {
      calendar = {
        format = {
          today = "<span color='#98971A'><b>{}</b></span>";
        };
      };
      format = "{:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "{:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      sort-by-number = true;
      format-icons = {
        "1" = "I";
        "2" = "II";
        "3" = "III";
        "4" = "IV";
        "5" = "V";
        "6" = "VI";
        "7" = "VII";
        "8" = "VIII";
        "9" = "IX";
        "10" = "X";
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };
    cpu = {
      format = "<span foreground='${green}'> </span>{usage}% ";
      format-alt = "<span foreground='${green}'> </span>{avg_frequency} GHz ";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    memory = {
      format = "<span foreground='${cyan}'>󰟜 </span>{}% ";
      format-alt = "<span foreground='${cyan}'>󰟜 </span>{used} GiB ";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    disk = {
      format = "<span foreground='${orange}'>󰋊 </span>{percentage_used}% ";
      interval = 60;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    } ;
    "hyprland/language" = {
      format = "<span foreground='${red}'> </span>{}";
      format-se = "Swedish  ";
      format-custom_se = "Custom ";
      on-click = "hyprctl switchxkblayout by-tech-gaming-keyboard next";
    };
  };
  programs.waybar.style = ''
    * {
      font-family: "${custom.font}", "Symbols Nerd Font Mono", "Symbols Nerd Font";
      font-size: ${custom.font_size};
      font-weight: ${custom.font_weight};
      color: ${custom.text_color};
      min-height: 0;
    }
    window#waybar {
      background: transparent;
    }
    #workspaces,
    #clock,
    #cpu,
    #memory,
    #disk,
    #language {
      background: transparent;
      color: ${custom.text_color};
    }
    #clock {
      color: ${custom.blue};
    }
    #workspaces button {
      background: transparent;
      color: ${custom.yellow};
      opacity: 0.5;
      padding: 0 8px;
      border-radius: 6px;
    }
    #workspaces button.active {
      background: alpha(${custom.green}, 0.18);
      color: ${custom.green};
      opacity: 1;
      border-radius: 6px;
    }
    .modules-left,
    .modules-center,
    .modules-right {
      background: transparent;
      border-bottom: ${custom.indicator_height} solid ${custom.border_color};
    }
  '';
}
