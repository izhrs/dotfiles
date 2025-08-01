{ pkgs, ... }: {
  users.users.izhrs = {
    isNormalUser = true;
    description = "Mohamed Izhar";
    extraGroups =
      [ "networkmanager" "wheel" "libvirtd" "kvm" "adbusers" "docker" ];
    packages = [ ];
    shell = pkgs.zsh;
  };
}
