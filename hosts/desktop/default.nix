{ config, lib, pkgs, ... }: let
  inherit (config) values;
in {
  imports = [./hardware.nix];

  zramSwap.enable = true;

  custom = {
    ssh = {
      enable = true;
    };
    boot.enable = true;
    fish.enable = true;
    atuin.enable = true;
    graphics = {
      nvidia ={
        enable = true;
        open = true;
      };
    };
    podman = {
      enable = true;
    };
    tailscale.enable = true;
    networking = {
      hostName = "glacier-flake";
      useDHCP = true;
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
      xr.enable = true;
    };
  };

  services.ratbagd.enable = true;

  environment.systemPackages = with pkgs; [
    # razergenie
    piper
    heroic
    bazecor
  ];

  home-manager.users.${values.mainUser} = {
    programs = {
      mpv.config.ao = "pulse";
      jerry.config.player_arguments = lib.mkForce "";
    };

    wayland.windowManager.hyprland.settings = {
      general.snap = {
        enabled = true;
        window_gap = 20;
        monitor_gap = 20;
      };

      workspace = [
        "name:1, monitor: DP-2"
      ];
      monitor = [
        # "DP-2, 3440x1440@144, 0x0, 1, cm, hdr, bitdepth, 10"
        "DP-1, 3440x1440@144, 0x0, 1"
        "DP-2, 1920x1080@74.97, 3440x0, 1, transform, 3"
      ];
    };
  };

  # nixpkgs.config.permittedInsecurePackages = [
  #   "python3.12-youtube-dl-2021.12.17"
  # ];

  # hardware.openrazer = {
  #   enable = true;
  #   users = [ values.mainUser ];
  # };

  system.stateVersion = "25.05";
}
