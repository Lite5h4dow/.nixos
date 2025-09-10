{ config, lib, pkgs, system, ...}: let
  inherit (config) values;
  inherit (lib) mkForce;
  inherit (pkgs.stdenv) mkDerivation;
  

  # rke2-traefik-config = pkgs.writeTextFile {
  #   name = "00-use-traefik.yaml";
  #   text = ''
  #     ingress-controller: traefik
  #     enable-servicelb: true
  #   '';
  # };
  
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

    server = {
      k3s = {
        enable=true;
      };
    };
  };

  time.timeZone = "Europe/London";

  networking = {
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
        6443
        8080
        8888
        9000
        10250
        25565
      ];
      allowedUDPPorts =[
        25565
        8472
      ];
    };
    defaultGateway= "192.168.1.1";
    nameservers = ["1.1.1.1"];
  };

  # environment.etc.rke2-use-traefik ={
  #   source = rke2-traefik-config;
  #   target = "rancher/rke2/config.yaml.d/00-use-traefik.yaml";
  # };
}
