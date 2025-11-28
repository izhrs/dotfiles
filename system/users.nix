{ pkgs, ... }: {
  users.users.izhrs = {
    isNormalUser = true;
    description = "Mohamed Izhar";
    extraGroups =
      [ "networkmanager" "wheel" "libvirtd" "kvm" "adbusers" "docker" "i2c" ];
    packages = [ ];
    shell = pkgs.zsh;
  };
}
