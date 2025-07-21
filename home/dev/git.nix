{pkgs, ...}:{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config.credential.helper = "libsecret";

    userName = "litelotus";
    userEmail = "lite5h4dow+dev@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";

      push = {
        autoSetupRemote = true;
      };

      url = {
        "https://github.com/".insteadOf = "github+https:";
        "ssh://git@github.com/".insteadOf = "github:";

        "https://git.litelot.us/".insteadOf = "git+https:";
        "ssh://git.litelot.us/".insteadOf = "git:";
      };
    };
  };
}
