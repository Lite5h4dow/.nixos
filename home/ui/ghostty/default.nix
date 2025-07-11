{ config, ...}:let
  inherit (config.stylix) fonts;
in {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;

    # config = {
    #   font-family = fonts.sansSerif.name;
    #   theme = "catppuccin-mocha";
    # };
  };

  #   file = {
  #   ".config/ghostty/config" ={
  #     source = ./config;
  #   };
  # };
}
