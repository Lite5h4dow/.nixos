{ pkgs, lib, config, ... }: let
  inherit (config) home-manager;
  inherit (config.values) mainUser;
in {
  programs.command-not-found.enable = false;
  programs.fish.enable = true;

  users.users.${mainUser}.shell = home-manager.users.${mainUser}.programs.fish.package;

  environment = {
    systemPackages = with pkgs; [
      eza
      opentofu
      google-cloud-sdk
    ];
  };
}
