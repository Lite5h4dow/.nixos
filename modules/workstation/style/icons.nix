{
  pkgs,
  config,
  ...
}: {
  stylix.icons = {
    package = pkgs.catppuccin-papirus-folders.override {
      flavor = "macchiato";
      accent = "teal";
    };
    name = "Papirus-Dark";
  };

  environment.systemPackages = [
    config.stylix.icons.package
    pkgs.breeze-icons
  ];
  programs.gdk-pixbuf.modulePackages = [pkgs.librsvg];
}
