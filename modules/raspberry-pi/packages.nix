{ pkgs, lib, config, ... }: let
  inherit (config) home-manager;
  inherit (config.values) mainUser;
in {
  programs.command-not-found.enable = false;

  environment = {
    systemPackages = with pkgs; [
      
    ];
  };
}
