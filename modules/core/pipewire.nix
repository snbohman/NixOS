{ pkgs, ... }:
{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    lowLatency.enable = true;
    wireplumber.enable = true;
  };
  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
