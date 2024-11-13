{osConfig, ...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  config = {
    stylix = {
      inherit (osConfig.stylix) icons;
      targets.qt = osConfig.stylix.targets.qt;
    };
  };
}
