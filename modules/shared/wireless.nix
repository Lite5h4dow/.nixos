{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  cfg = config.custom.networking.wireless;
  mobile = config.custom.mobile;
in {
  options = {
    custom.networking.wireless.enable = lib.mkEnableOption "Enable Wireless module";
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
