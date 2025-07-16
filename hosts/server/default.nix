{ config, lib, pkgs, ...}: let
  inherit (config) values;
  inherit (lib) mkForce;
  inherit (pkgs.stdenv) mkDerivation;
  
  rke2-traefik-config = ''
    ingress-controller: traefik
  '';
  
  rke2-traefik = mkDerivation {
    name = "rke2 use traefik";
    installPhase = "echo ${rke2-traefik-config} > /etc/rancher/rke2/config.yaml.d/00-use-traefik.yaml";
  };
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

  environment.systemPackages = [ rke2-traefik ];

}
