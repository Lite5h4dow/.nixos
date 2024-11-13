{lib, config, pkgs, ...}: let
  cfg = config.custom.graphics.intel;
  inherit (lib) mkIf mkEnableOption types;
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
