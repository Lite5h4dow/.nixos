{ config, lib, pkgs, ...}: let
  inherit (config) values;
in {
  custom = {
    ssh = {
      enable = true;
    };
    boot.enable = true;
    fish.enable = true;
    atuin.enable = true;
    podman = {
      enable = true;
    };
    tailscale.enable = true;

    virtualisation ={
      qemu ={
        enable = true;
        quickemu = {
          enable = true;
        };
      };
    };
  };
}
