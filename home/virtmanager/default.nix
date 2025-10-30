{ pkgs, ... }: {
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  xdg.desktopEntries.virt-manager = {
    name = "Virtual Machine Manager";
    genericName = "Virtual machine viewer/manager";
    comment = "Manage virtual machines";
    exec = "virt-manager";
    terminal = false;
    type = "Application";
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/virt-manager.svg";
    categories = [ "System" "Emulator" "GTK" ];
  };
}
