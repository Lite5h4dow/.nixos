{ inputs, pkgs, ...}: {
  imports = [
    inputs.stylix.nixosModules.stylix

    ./options

    ./qt.nix
    ./cursor.nix
    ./fonts.nix
    # ./icons.nix
  ];

  config = {
    stylix = {
      enable = true;
      polarity = "dark";
      image = inputs.wallpapers + /NixOS.png;
      opacity ={
        terminal = 0.95;
        overlay = 0.95;
      };
    };
  };
}
