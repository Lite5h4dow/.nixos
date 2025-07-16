{ config, lib, pkgs, system, ...}: let
  inherit (config) values;
  inherit (lib) mkForce;
  inherit (pkgs.stdenv) mkDerivation;
  

  rke2-traefik-config = pkgs.writeTextFile {
    name = "00-use-traefik.yaml";
    text = ''
      ingress-controller: traefik
    '';
    destination = "/etc/rancher/rke2/config.yaml.d/00-use-traefik.yaml";
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

  environment.systemPackages = [
    (pkgs.symlinkJoin{
      name = "rke2-use-traefik";
      paths = [ rke2-traefik-config ];
    })
  ];

}
