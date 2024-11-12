{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkForce mkIf;
in {
  options.custom.mobile.enable = mkEnableOption "config for mobile devices";

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
      openssh = {
        enable = true;
        startWhenNeeded = true;
        settings.PermitRootLogin = "yes";
      };

      power-profiles-daemon.enable = mkForce false;
      auto-cpufreq.enable = true;
      thermald.enable = true;
    };
  };
}
