{ pkgs, ... }: {
  users.mutableUsers = false;
  users.users.izhrs = {
    isNormalUser = true;
    # generated from `mkpasswd -m sha-512`
    hashedPassword = "$6$r9W9Q2GRB50QzaDm$W0MaMODLGU/QyIBQ6AHO8L9JI2naGCnGwAwXphjJqrKNLKfx2KBg3.LExv4oNXl.uyETPz6QJ61sf4.K3yOPu0";
    description = "Retarded Rabbit";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "kvm"
      "adbusers"
      "docker"
      "i2c"
      "video"
      "render"
    ];
    packages = [ ];
    shell = pkgs.zsh;
  };
}
