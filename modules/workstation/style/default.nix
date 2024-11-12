{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix

    ./options

    # ./qt.nix
    # ./cursor.nix
    ./fonts.nix
    # ./icons.nix
  ];

  config = {
    stylix = {
      enable = true;
      base16Scheme = pkgs.base16-schemes + /share/themes/silk-dark.yaml;
      polarity = "dark";
    }
  }
}
