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
        border = mkLiteral "1px";
        border-radius = mkLiteral "10px";
        width = mkLiteral "1024px";
      };

      mainbox = {
        spacing = mkLiteral "8px";
        children = mkLiteral "[inputbar,wrapper-mode-switcher,listview]";
      };

      "listview, inputbar, message" = {
        padding = mkLiteral "0.5em";
        border = mkLiteral "1px";
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

      element = {
        border = mkLiteral "0";
        padding = mkLiteral "10";
        orientation = mkLiteral "vertical";
      };

      element-icon = {
        size = mkLiteral "5em";
      };

      "element-text, element-icon" ={
        font = mkLiteral "inherit";
        horizontal-align = mkLiteral "0.5";
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
