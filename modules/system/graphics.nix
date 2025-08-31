{ ... }:
{
    programs.hyprland.enable = true;
    hardware.nvidia.modesetting.enable = true;
    services.xserver.xkb = {
        layout = "se";
        variant = "";
    };
}
