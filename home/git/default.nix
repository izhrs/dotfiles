{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    settings = {
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";

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
