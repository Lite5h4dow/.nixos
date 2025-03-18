{lib', inputs}: let
  inherit (inputs) nixpkgs;
  inherit (lib') mkNixosSystem;

  modulePath = ../modules;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  server = modulePath + /server;
  raspberry-pi = modulePath + /raspberry-pi;

  pi-image = mkNixosSystem {
    system = "aarch64-linux";
    modules = [
      "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
      ./raspberry-pi
      raspberry-pi
      shared
    ];
  };

in {
  raspberry-pi = pi-image.config.system.build.sdImage;
  }
