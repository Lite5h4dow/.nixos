{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  cfg = config.custom.networking.wireless;
  mobile = config.custom.mobile;
  inherit (lib) types mkEnableOption;
in {
  options = {
    custom.networking.wireless = {
      enable = mkEnableOption {
        description = "Enable Wireless module";
        type = types.boolean;
        default = false;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    networking = {
      wireless = {
        iwd = {
          enable = true;
          settings = {
            IPv6.Enabled = true;
            Settings.AutoConnect = true;
          };
        };
      };
      networkmanager.wifi = {
        backend = "iwd";
        powersave = mobile.enable;
      };
    };
  };
}
