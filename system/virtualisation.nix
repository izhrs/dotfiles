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

    docker = {
      enable = true;
      rootless = {
        enable = false; # needed for winboat
        setSocketVariable = true;
      };
    };

    # following configuration is added only when building VM with build-vm
    # https://nixos.wiki/wiki/NixOS:nixos-rebuild_build-vm
    vmVariant.virtualisation = {
      memorySize = 8192; # Use 8GB memory.
      cores = 2;
    };
  };

  environment.systemPackages = with pkgs; [ winboat ];

  # for OSX-KVM
  # https://wiki.nixos.org/wiki/OSX-KVM
  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';
}
