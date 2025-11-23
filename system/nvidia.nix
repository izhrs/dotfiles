{ config, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    # enable opengl
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.finegrained = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:0:2";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
