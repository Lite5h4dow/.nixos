{ config, lib, pkgs, ...}: let
  inherit (config) values;
in {
  zramSwap.enable = true;

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
      };
    };

    server={
      kubernetes = {
        enable = true;
      };
    };
  };
}
