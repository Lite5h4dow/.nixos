{ inputs, pkgs, ...}: {
  imports = [
    inputs.stylix.nixosModules.stylix

    ./options

    ./qt.nix
    ./cursor.nix
    ./fonts.nix
    ./icons.nix
  ];

  config = {
    stylix = {
      enable = true;
      base16Scheme = pkgs.base16-schemes + /share/themes/catppuccin-mocha.yaml;
      polarity = "dark";
      image = inputs.wallpapers + /a-collection-of-autumn-vibes-21x9-3440x1440-wallpapers-v0-j66d7h4c9wzd1.webp;
    };
  };
}
