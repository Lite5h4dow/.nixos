{ config, ...}:let
  inherit (config.stylix) fonts;
in {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings ={
      shell-integration-features = "ssh-terminfo,ssh-env";
    };
  };
  systemd.user.settings.Manager.DefaultEnvironment = {
    TERM = "ghostty";
  };
}
