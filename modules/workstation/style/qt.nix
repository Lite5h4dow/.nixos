{ pkgs, lib, ... }:
let
  kdePackage = pkgs.catppuccin-kde.override {
    flavour = [ "macchiato" ];
    accents = [ "teal" ];
  };

  kvantumPackage = pkgs.catppuccin-kvantum.override {
    accent = "teal";
    variant = "macchiato";
  };
  inherit (lib) mkForce;
in
{
  # This is required, because the hm module is missing something
  # I may or may not be too lazy to fix it
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = mkForce "kvantum";
  };

  stylix.targets.qt = {
    colors = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/Catppuccin-Macchiato.conf";
    kdeglobals = "${kdePackage}/share/color-schemes/CatppuccinMacchiatoTeal.colors";
    kvantum = {
      config = "${kvantumPackage}/share/Kvantum/catppuccin-macchiato-teal/catppuccin-macchiato-teal.kvconfig";
      svg = "${kvantumPackage}/share/Kvantum/catppuccin-macchiato-teal/catppuccin-macchiato-teal.svg";
    };
  };
}
