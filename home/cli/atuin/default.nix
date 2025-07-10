{pkgs, lib, osConfig, ...}: let
  inherit (lib) optionals mkIf types;
  inherit (osConfig.custom) atuin fish corporate; 
  canSync = (!corporate.enable);
in {

  imports = optionals atuin.enable [
    
  ];

  config = mkIf atuin.enable {
    programs = {
      atuin = {
        enable = true;
        enableFishIntegration = fish.enable;
        settings = if canSync then {
          auto_sync = true;
          sync_address = "https://atuin.litelot.us";
          sync_frequency = "5m";
          search_mode = "fuzzy";
        }else{
          search_mode = "fuzzy";
        };
      };
    };
  };
}
