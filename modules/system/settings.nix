{ pkgs, ... }:

{
    # Networking
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    # Locale
    time.timeZone = "Europe/Stockholm";
    i18n.defaultLocale = "en_US.UTF-8";

    # Shell
    programs.zsh.enable = true;

    # Configure console keymap
    console.keyMap = "sv-latin1";
    users.users.snbohman = {
        isNormalUser = true;
        description = "snbohman";
        extraGroups = [ "wheel" "networkmanager" "video" ];
        shell = pkgs.zsh;
    };

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
        git
        wget
        unzip
    ];

    # Sound
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    # Firewall
    networking.firewall.enable = true;

    # Nix settings
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.gc = {
        automatic = true;
        options = "--delete-older-than 7d";
    };

    system.stateVersion = "25.11";
}
