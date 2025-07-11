{ config, lib, pkgs, ...}: let
  inherit (config) values;
  inherit (lib) mkForce;
in {
  zramSwap.enable = true;

  custom = {
    ssh = {
      enable = true;
    };
    boot.enable = true;
    fish.enable = true;
    atuin.enable = true;
    tailscale.enable = true;

    virtualisation ={
      qemu ={
        enable = true;
      };
    };
  };

  networking ={
    enableIPv6 = mkForce false;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        21
        22
        80
        443
        2202
        2379
        2380
        8888
        10250
        25565
      ];
      allowedUDPPorts =[
        25565
        8472
      ];
    };
  };
}
