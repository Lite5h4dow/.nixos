{ config, lib, pkgs, ... }: let
  inherit (config) values;
in {
  imports = [./hardware.nix];

  zramSwap.enable = true;

  custom = {
    minimal = false;
    boot.enable = true;
    fish.enable = true;
    atuin.enable = true;
    mobile.enable = true;
    graphics = {
      intel.enable = true;
      nvidia ={
        enable = true;
        prime ={
          enable=true;
        };
      };
    };
    podman = {
      enable = true;
    };
    docker = {
      enable = false;
    };
    bluetooth.enable = true;
    tailscale.enable = true;
    networking = {
      hostName = "glacier-flake";
      useDHCP = true;
      wireless.enable = true;
    };

    virtualisation ={
      qemu ={
        enable = true;
        quickemu = {
          enable = true;
        };
        ui.enable = true;
      };
    };

    gaming ={ 
      enable = true;
      # xr.enable = true;
    };

    rebuildName = "laptop";
  };

  environment.systemPackages = with pkgs; [
    # razergenie
  ];

  home-manager.users.${values.mainUser} = {
    programs = {
      mpv.config.ao = "pulse";
      jerry.config.player_arguments = lib.mkForce "";
    };

    wayland.windowManager.hyprland.settings ={
      general ={
        snap = {
          enabled = true;
          window_gap = 20;
          monitor_gap = 20;
        };
      };
      input ={
        kb_options ="caps:swapescape";
      };
    };
  };

  networking.hostName = "glacier-blade";

  # nixpkgs.config.permittedInsecurePackages = [
  #   "python3.12-youtube-dl-2021.12.17"
  # ];

  # hardware.openrazer = {
  #   enable = true;
  #   users = [ values.mainUser ];
  # };

  system.stateVersion = "24.11";
}
