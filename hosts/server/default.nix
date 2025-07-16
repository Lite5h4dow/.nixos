{ config, lib, pkgs, system, ...}: let
  inherit (config) values;
  inherit (lib) mkForce;
  inherit (pkgs.stdenv) mkDerivation;
  

  rke2-traefik-config = pkgs.writeTextFile {
    name = "00-use-traefik.yaml";
    text = ''
      ingress-controller: traefik
      enable-servicelb: true
    '';
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

  environment.etc.rke2-use-traefik ={
    source = rke2-traefik-config;
    target = "rancher/rke2/config.yaml.d/00-use-traefik.yaml";
  };
}
