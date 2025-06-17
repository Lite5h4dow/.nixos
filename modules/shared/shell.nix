{config, lib, pkgs, ...}: let
  inherit (lib) mkIf mkEnableOption types;
  inherit (config.values) mainUser; 
  inherit (config.custom) fish;
in  {
  options = {
    custom.fish.enable = mkEnableOption {
      description = "enable fish as default shell";
      type = types.bool;
      default = true;
    };
    custom.atuin.enable = mkEnableOption{
      description = "enable Atuin in home config";
      type = types.bool;
      default = false;
    };
  };
  config = mkIf fish.enable {
    programs.fish = {
      enable = true;
    };

    users.users.${mainUser}.shell = pkgs.fish;
  };
}
