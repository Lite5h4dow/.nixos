{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  cfg = config.custom.bluetooth;
  inherit (lib) types;
in {
  options = {
    custom.bluetooth.enable = lib.mkEnableOption {
      description = "Enable Bluetooth module";
      type = types.boolean;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          experimental = true;
        };
      };
    };
    services = {
      blueman.enable = true;
    };
  };
}
