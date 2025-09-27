{osConfig, ...}: {
  imports = [
    ./shared.nix
    ./gtk.nix
    ./qt.nix
  ];

  config = {
    stylix = {
      autoEnable = true;
      polarity = "dark";
      # inherit (osConfig.stylix) icons;
      targets = {
        yazi.enable = true;
        qt = osConfig.stylix.targets.qt;
      };
    };
  };
}
