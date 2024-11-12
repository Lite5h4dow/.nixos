{
  pkgs,
  lib,
  config,
  ...
}:let
  inherit (config.values) mainUser;
  inherit (config) home-manager;
in {
  programs.command-not-found.enable =  false;
  programs.fish.enable = true;

  users.users.${mainUser}.shell = home-manager.users.${mainUser}.programs.fish.package;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      wl-clipboard
      exa
      pavucontrol
      pulsemixer
      obsidian
    ];
  };
}
