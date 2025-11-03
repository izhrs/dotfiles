{
  programs.git = {
    enable = true;

    settings = {
      user.name = "izhrs";
      user.email = "mohamed@izhar.xyz";

      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      side-by-side = true;
    };
  };
}
