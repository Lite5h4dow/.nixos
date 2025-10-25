{ inputs, ...}: {
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
      image = inputs.wallpapers + ./xvtwy2e79tnf1.png;
      opacity ={
        terminal = 0.95;
        popups = 0.95;
        desktop = 0.95;
      };
    };
  };
}
