{lib', inputs}: let
  inherit (inputs) nixpkgs;
  inherit (lib') mkNixosSystem;
  inherit (nixpkgs.lib) optional;

  modulePath = ../modules;
  hostPath = ../hosts;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  server = modulePath + /server;
  raspberry-pi = modulePath + /raspberry-pi;
  raspberry-pi-host = hostPath + /raspberry-pi;

  pi-modules = os: [
    "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
    raspberry-pi-host
    raspberry-pi
    shared
  ]
  ++ optional (os == "rpi0") (raspberry-pi-host + /rpi0.nix)
  ++ optional (os == "rpi02w") (raspberry-pi-host + /rpi02w.nix)
  ++ optional (os == "rpi3") (raspberry-pi-host + /rpi3.nix)
  ;

  "rpi02w" = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules "rpi02w";
  };

  "rpi0" = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules "rpi0";
  };

  "rpi3" = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules "rpi3";
  };

in {
  rpi02w = rpi02w.config.system.build.sdImage;
  rpi0 = rpi0.config.system.build.sdImage;
  rpi3 = rpi3.config.system.build.sdImage;
  }
