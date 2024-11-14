{config, lib, ...}: let
  inherit (config) values;
in {
  custom = {
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

  system.stateVersion = "24.05";
}
