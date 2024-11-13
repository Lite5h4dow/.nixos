{lib, config, pkgs, ...}: let
  inherit (lib) mkIf mkEnableOption types;
  cfg = config.custom.graphics.intel;
in {
  options = {
    custom.graphics.intel = {
      enable = mkEnableOption {
        description = "Enable the Intel graphics module";
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    hardware = {
      graphics.extraPackages = with pkgs; [
        intel-vaapi-driver
        intel-media-driver
      ];
    };
  };
}
