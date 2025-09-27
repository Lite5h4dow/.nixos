{osConfig, pkgs, ...}:let

  scheme = pkgs.base16-schemes + /share/themes/catppuccin-macchiato.yaml;
 in {
  imports = [
    ./shared.nix
    ./gtk.nix
    ./qt.nix
  ];

  config = {
    stylix = {
      autoEnable = true;
      base16Scheme = scheme;
      polarity = "dark";

      # inherit (osConfig.stylix) icons;
      targets = {
        yazi.enable = true;
        qt = osConfig.stylix.targets.qt;
        helix={
          transparent = true;
        };
      };
    };
  };
}
