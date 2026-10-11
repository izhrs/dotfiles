{ config, lib, ... }:
let
  storage = "${config.home.homeDirectory}/.local/share/windows-vm";
in
{
  xdg.configFile."containers/systemd/windows.container".text =
    lib.generators.toINI { listsAsDuplicateKeys = true; }
      {
        Unit.Description = "Windows VM (Dockur)";

        Container = {
          Image = "ghcr.io/dockur/windows:5.14";
          ContainerName = "windows";

          Environment = [
            "VERSION=10"
            "RAM_SIZE=16G"
            "CPU_CORES=4"
            "DISK_SIZE=64G"
            "USERNAME=rabbit"
            "PASSWORD=windows"
            "LANGUAGE=English"
            "REGION=en-US"
            "KEYBOARD=en-US"
            "NETWORK=user"
          ];

          PublishPort = [
            "0.0.0.0:8006:8006/tcp"
            "0.0.0.0:3389:3389/tcp"
            "0.0.0.0:3389:3389/udp"
          ];

          Volume = "${storage}:/storage";
          AddDevice = "/dev/kvm";
          AddCapability = "NET_ADMIN";
          GroupAdd = "keep-groups";
          PodmanArgs = "--stop-timeout=120";
        };

        Service.TimeoutStartSec = 0;
      };

  systemd.user.tmpfiles.rules = [ "d ${storage} 0755 - - -" ];
}
