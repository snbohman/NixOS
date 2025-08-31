{ ... }:

{
    boot.loader.grub = {
        enable = true;
        # Define the boot device.
        # Ensure "/dev/sda" is the correct disk where you want to install the bootloader.
        # You can check with `lsblk`.
        device = "/dev/sda1";
    };
}
