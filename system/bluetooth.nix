{ pkgs, ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
        enable = "source,sink,media,socket";
      };
    };
  };
}
