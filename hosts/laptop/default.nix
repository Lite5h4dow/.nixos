{
  config,
  lib,
  ...
}: let
  inherit (config) values;
in {
  imports = [./hardware.nix];

  zramSwap.enable = true;


  custom = {
    mobile.enable = true;
    graphics = {
      intel.enable = true;
      nvidia.enable = true;
    };
    docker = {
      enable = true;
      nvidia = true;
    };
    bluetooth.enable = true;
    tailscale.enable = true;
    networking = {
      hostName = "glacier-flake";
      useDHCP = true;
      wireless.enable = true;
    };

    # gaming ={ 
    #   enable = true;
    #   xr.enable = true;
    # };
  };

  home-manager.users.${values.mainUser} = {
    programs = {
      mpv.config.ao = "pulse";
      jerry.config.player_arguments = lib.mkForce "";
    };
  };

  system.stateVersion = "24.05";
}
