{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        3000
        8080
      ];
      allowedUDPPorts = [ ];
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "izhrs" ];
    };
  };
}
