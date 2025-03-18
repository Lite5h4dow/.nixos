{ config, lib, pkgs, lib', ...}: let
  cfg = config.custom.networking.wireless;
  inherit (config.custom.networking) useIPv6;
  mobile = config.custom.mobile;
  inherit (lib) types mkIf mkEnableOption;
in {
  options = {
    custom.networking.wireless = {
      enable = mkEnableOption {
        description = "Enable Wireless module";
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    networking = {
      wireless = {
        enable = true;
        iwd = {
          enable = true;
          settings = {
            IPv6.Enabled = useIPv6;
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
