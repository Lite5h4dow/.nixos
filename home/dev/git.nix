{pkgs, ...}:{
  programs.git = {
    enable = true;

    userName = "litelotus";
    userEmail = "lite5h4dow+dev@gmail.com";

    extraConfig = {
      credential = {
        # helper = "${pkgs.git-credential-oauth}/bin/git-credential-oauth";
        credentialStore = "secretservice";
        "https://git.litelot.us".username = "litelotus";
      };
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
