{osConfig, ...}: {
  imports = [
    ./shared.nix
    ./gtk.nix
    ./qt.nix
  ];

  config = {
    stylix = {
      # inherit (osConfig.stylix) icons;
      targets = {
        yazi.enable = true;
        qt = osConfig.stylix.targets.qt;
      };
    };
  };
}
