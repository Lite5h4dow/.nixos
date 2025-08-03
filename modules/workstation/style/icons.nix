{lib, pkgs, config, ...}:let
  inherit (lib) mkForce;
in {
  # stylix.icons = {
  #   package = mkForce pkgs.catppuccin-papirus-folders.override {
  #     flavor = "mocha";
  #     accent = "teal";
  #   };
  #   name = "Papirus-Dark";
  # };

  # environment.systemPackages = [
  #   config.stylix.icons.package
  #   pkgs.libsForQt5.breeze-icons
  #   # pkgs.breeze-icons
  # ];
  programs.gdk-pixbuf.modulePackages = [pkgs.librsvg];
}
