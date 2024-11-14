{
  programs.git = {
    enable = true;

    userName = "litelotus";
    userEmail = "lite5h4dow+dev@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";

      push = {
        autoSetupRemote = true;
      };

      url = {
        "https://github.com/".insteadOf = "github:";
        "ssh://git@github.com/".insteadOf = "github:";

        "https://git.litelot.us/".insteadOf = "git:";
        "ssh://git.litelot.us/".insteadOf = "git:";
      };
    };
  };
}
