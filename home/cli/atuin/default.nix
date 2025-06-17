{pkgs, lib, osConfig, ...}: let
  inherit (lib) optionals mkIf types;
  inherit (osConfig.custom) atuin fish; 
in {

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
