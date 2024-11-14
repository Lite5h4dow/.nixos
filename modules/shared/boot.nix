{ config, lib, pkgs, inputs, ... }: let
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
        };
      };

      tmp.useTmpfs = mkDefault true;
      kernelPackages = mkDefault pkgs.linuxPackages_latest;
      kernelParams = ["quiet"];
    };
  };
}
