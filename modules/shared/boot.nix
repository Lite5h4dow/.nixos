{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (lib) mkEnableOption mkDefault;

  cfg = config.custom.boot;
in {
  options = {
    
  }

  config = {
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
      kernelPackages = mkDefault pkgs.linuxPackagaes_latest;
      kernelParams = ["quiet"];
    };
  };
}
