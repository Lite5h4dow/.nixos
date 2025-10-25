{ inputs, pkgs, ...}: let
  scheme = pkgs.base16-schemes + /share/themes/catppuccin-macchiato.yaml;
in{
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
      polarity = "dark";
      # image = inputs.wallpapers + /NixOS.png;
      base16Scheme = scheme;
      opacity = {
        terminal = 0.95;
        popups = 0.95;
        desktop = 0.95;
      };
    };
  };
}
