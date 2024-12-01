{
  pkgs,
  config,
  ...
}: let
  inherit (config.stylix) fonts;
in {
  stylix = {
    fonts = {
      sansSerif = {
        package = pkgs.fira-code;
        name = "FiraCode";
      };

      # serif = stylix.fonts.sansSerif;
      serif = fonts.sansSerif;

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Fonts Mono";
      };
    };
  };
}
