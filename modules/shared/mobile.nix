{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkForce mkIf types;
in {
  options.custom.mobile.enable = mkEnableOption {
    description = "config for mobile devices";
    type = types.bool;
    default = false;
  };

  config = mkIf config.custom.mobile.enable {
    environment.systemPackages = [
      pkgs.brightnessctl
    ];

    networking = {
      wireless = {
        iwd.enable = true;
      };
    };

    services = {
      power-profiles-daemon.enable = mkForce true;
      auto-cpufreq.enable = mkForce false;
      thermald.enable = true;
    };
  };
}
