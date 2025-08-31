{ pkgs, ... }:
{
    time.timeZone = "Europe/Stockholm";
    i18n.defaultLocale = "en_US.UTF-8";

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

    # Nix settings
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.05";
}
