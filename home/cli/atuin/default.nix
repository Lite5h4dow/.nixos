{pkgs, lib, osConfig, ...}: let
  inherit (lib) optionals mkIf types;
  inherit (osConfig.custom) atuin fish; 
in {
  options = {
    osConfig.custom.atuin = {
      description = "enable Atuin in home config";
      type = types.bool;
      default = false;
    };
  };

  imports = optionals atuin.enable [
    
  ];

  config = mkIf atuin.enable {
    programs = {
      atuin = {
        enable = true;
        enableFishIntegration = fish.enable;
      };
    };
  };
}
