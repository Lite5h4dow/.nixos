{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  cfg = config.custom.bluetooth;
in {
  options = {
    custom.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth Module";
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
