{lib', inputs}: let
  inherit (inputs) nixpkgs;
  inherit (lib') mkNixosSystem;

  modulePath = ../modules;
  hostPath = ../hosts;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  server = modulePath + /server;
  raspberry-pi = modulePath + /raspberry-pi;
  raspberry-pi-host = hostPath + /raspberry-pi;

  pi-modules = [
    "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
    raspberry-pi-host
    raspberry-pi
    shared
  ];

  pi-02w = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules
      ++ raspberry-pi-host + /rpi02w.nix;
  };

  pi-0 = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules
      ++ raspberry-pi-host + /rpi0.nix;
  };

  pi-3 = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules
      ++ raspberry-pi-host + /rpi3.nix;
  };

in {
  rpi02w = pi-02w.config.system.build.sdImage;
  rpi0 = pi-0.config.system.build.sdImage;
  rpi3 = pi-3.config.system.build.sdImage;
  }
