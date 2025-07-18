{ config, lib, pkgs, ... }: let
  inherit (lib) mkIf mkEnableOption mkDefault types;

  cfg = config.custom.boot;
in {
  options = {
    custom.boot.enable = mkEnableOption {
      description = "Enable Boot module";
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable  {
    boot = {
      loader = {
        timeout = 0;

        systemd-boot = {
          enable = true;
          consoleMode = "auto";
          editor = false;
          configurationLimit = 5;
          graceful = true;
        };
      };

      tmp.useTmpfs = mkDefault true;
      # kernelPackages = mkDefault pkgs.linuxPackages_latest;
      kernelPackages = mkDefault pkgs.linuxPackages_6_14;
      kernelParams = ["quiet"];
    };
  };
}
