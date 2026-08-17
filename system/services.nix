{
  services = {
    printing.enable = true;

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "izhrs" ];
      };
    };
  };
}
