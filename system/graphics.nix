{ config, pkgs, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    # enable opengl
    graphics.enable = true;

    graphics.extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      intel-compute-runtime
    ];

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

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
