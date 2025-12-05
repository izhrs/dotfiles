{ pkgs, ... }: {
  users.mutableUsers = false;
  users.users.izhrs = {
    isNormalUser = true;
    # generated from mkpasswd
    hashedPassword =
      "$6$r9W9Q2GRB50QzaDm$W0MaMODLGU/QyIBQ6AHO8L9JI2naGCnGwAwXphjJqrKNLKfx2KBg3.LExv4oNXl.uyETPz6QJ61sf4.K3yOPu0";
    description = "Mohamed Izhar";
    extraGroups =
      [ "networkmanager" "wheel" "libvirtd" "kvm" "adbusers" "docker" "i2c" ];
    packages = [ ];
    shell = pkgs.zsh;
  };
}
