{ config, lib, ... }: let
  inherit (config) values;
in {
  custom = {
    fish.enable = true;
    boot.enable = false;
    mobile.enable = false;
    graphics = {
      intel.enable = false;
      nvidia.enable = false;
    };
    bluetooth.enable = false;
    tailscale.enable = false;
    networking = {
      enable = false;
    };
  };

  system.stateVersion = "24.11";
}
