{
  programs.git = {
    enable = true;
    userName = "izhrs";
    userEmail = "mohamed@izhar.xyz";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
      };
    };
  };
}
