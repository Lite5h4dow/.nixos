{ config, lib, pkgs, ... }: let
  inherit (config) values;
in {
  imports = [./hardware.nix];

  zramSwap.enable = true;

  custom = {
    boot.enable = true;
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

  environment.systemPackages = with pkgs; [
    razergenie
  ];

  home-manager.users.${values.mainUser} = {
    programs = {
      mpv.config.ao = "pulse";
      jerry.config.player_arguments = lib.mkForce "";
    };
  };

  # nixpkgs.config.permittedInsecurePackages = [
  #   "python3.12-youtube-dl-2021.12.17"
  # ];

  hardware.openrazer = {
    enable = true;
    users = [ values.mainUser ];
  };

  system.stateVersion = "24.05";
}
