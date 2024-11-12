{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config) values;
in {
  imports = [./hardware.nix];

  zramSwap.enable = true;

  custom = {
    mobile.enable = true;
    nvidia.enable = true;
    docker = {
      enable = true;
      nvidia = true;
    };
    bluetooth.enable = true;
    tailscale.enable = true;
    networking = {
      wireless.enable = true;
      hostname = "glacier-flake";
      useDHCP = true;
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
