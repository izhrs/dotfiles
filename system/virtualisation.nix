{ pkgs, ... }: {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;

    podman = {
      enable = true;

      # Create a `docker` alias for podman
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };

    # following configuration is added only when building VM with build-vm
    # https://nixos.wiki/wiki/NixOS:nixos-rebuild_build-vm
    vmVariant.virtualisation = {
      memorySize = 8192; # Use 8GB memory.
      cores = 2;
    };
  };

  environment.systemPackages = [ pkgs.podman-compose ];
  programs.virt-manager.enable = true;
}
