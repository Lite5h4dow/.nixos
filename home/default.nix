{
  lib,
  osConfig,
  ...
}: let
  username = osConfig.values.mainUser;
in {
  imports = [
    ./rofi
    ./helix
    ./hyprland
    ./starship
    ./fish
    ./ags
    # ./mpv
    ./style
    
    ./alacritty.nix
    ./jerry.nix
    ./dunst.nix
    ./hypridle.nix
    ./schizofox.nix
    ./yazi.nix
    ./swayimg.nix
    # ./hyprpaper.nix
    ./nixcord.nix
    ./ytermusic.nix
    ./woodpecker-ci.nix
    ./git.nix
    ./kubectl.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = lib.mkDefault "24.05";
  };
}
