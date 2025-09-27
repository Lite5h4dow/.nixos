{ pkgs, config, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    theme = {
      window = {
        padding = mkLiteral "1em";
        border = mkLiteral "5px";
        border-radius = mkLiteral "10px";
        width = mkLiteral "1024px";
      };

      mainbox = {
        spacing = mkLiteral "0px";
        children = mkLiteral "[inputbar,wrapper-mode-switcher,listview]";
      };

      "listview, inputbar, message" = {
        padding = mkLiteral "0.5em";
        border = mkLiteral "5px";
        border-radius = mkLiteral "10px";
        background-color = "black/70%";

        columns = mkLiteral "4";
        lines = mkLiteral "4";
      };

      listview = {
        border = mkLiteral "0px 5px 5px 5px";
        border-radius = mkLiteral "0px 0px 10px 10px";
      };

      wrapper-mode-switcher = {
        orientation = mkLiteral "horizontal";
        expand = mkLiteral "false";
        spacing = mkLiteral "0";
      };
    };
  };
  home.packages = with pkgs; [
    # extensions
    # rofi-emoji
    rofimoji
    rofi-bluetooth
    rofi-power-menu
    rofi-systemd
    bitwarden-menu
  ];

  # home.file = {
  #   ".config/rofi" = {
  #     source =  ./config;
  #   };
  # };
}
