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
      sort-by-number=true;
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
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
      };
    };
    cpu = {
      format = " :{usage}%";
      format-alt = ":{avg_frequency} GHz";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    memory = {
      format = "󰟜:{}%";
      format-alt = "󰟜:{used} GiB";
      interval = 2;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    disk = {
      format = "󰋊:{percentage_used}%";
      interval = 60;
      on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
    };
    "hyprland/language" = {
      format = "{}";
      format-se = "Swedish";
      format-custom_se = "Custom";
      on-click = "hyprctl switchxkblayout by-tech-gaming-keyboard next";
    };
  };

  programs.waybar.style = ''
    * {
      font-family: "${custom.font}";
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
    #language,

    #workspaces button {
      background: transparent;
      color: ${custom.text_color};
    }

    #workspaces button.active {
      color: ${custom.green};
    }

    .modules-left,
    .modules-center,
    .modules-right {
      background: transparent;
      border-bottom: ${custom.indicator_height} solid ${custom.border_color};
    }
  '';
}
