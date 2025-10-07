{ config, ...}:let
  inherit (config.stylix) fonts;
in {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
  };
  systemd.user.settings.Manager.DefaultEnvironment = {
    TERM = "ghostty";
  };
}
