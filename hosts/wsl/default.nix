{config, lib, ...}: let
  inherit (config) values;
in {
  custom = {
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
    # gaming = {
    #   enable = false;
    #   xr.enable = false;
    # };
  };

  users.groups.docker = {};

  system.stateVersion = "24.11";
}
