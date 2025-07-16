{ config, lib, pkgs, system, ...}: let
  inherit (config) values;
  inherit (lib) mkForce;
  
  rke2-traefik-config = ''
    ingress-controller: traefik
  '';
  
  rke2-traefik = derivation {
    name = "rke2 use traefik";
    system = system;
    builder = "${pkgs.bash}/bin/bash";
    args = ["-c" "echo" "${rke2-traefik-config} > $out/etc/rancher/rke2/config.yaml.d/00-use-traefik.yaml"];
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
