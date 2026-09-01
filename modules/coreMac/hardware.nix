{ pkgs, config, ... }:
{
  hardware.graphics.enable = true;
  hardware.uinput.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
