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
      image = "~/.wallpapers/.selected";
      opacity ={
        terminal = 0.95;
        popups = 0.95;
        desktop = 0.95;
      };
    };
  };
}
