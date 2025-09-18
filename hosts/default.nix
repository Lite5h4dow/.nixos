{lib', inputs}: let
  inherit (lib') mkNixosSystem;
  inherit (inputs) nixpkgs;

  modulePath = ../modules;

  raspberry-pi = modulePath + /raspberry-pi;
  workstation = modulePath + /workstation;
  shared = modulePath + /shared;
  server = modulePath + /server;
  wsl = modulePath + /wsl;

in {
  desktop = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./desktop
      shared
      workstation
    ];
  };

  laptop = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./laptop
      shared
      workstation
    ];
  };

  wsl = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./wsl
      wsl
      shared
    ];
  };

  corp-wsl = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./wsl/corp.nix
      wsl
      shared
    ];
  };

  prodpod = mkNixosSystem {
    system = "aarch64-linux";
    modules = [
      "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
      ./raspberry-pi
      ./raspberry-pi/prodpod.nix
      raspberry-pi
      shared
    ];
  };

  raspberry-pi = mkNixosSystem {
    system = "aarch64-linux";
    modules = [
      "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
      ./raspberry-pi
      raspberry-pi
      shared
    ];
  };

  server-01 = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./server/01
      server
      shared
    ];
  };

  server-02 = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./server/02
      server
      shared
    ];
  };

  server-03 = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./server/03
      server
      shared
    ];
  };

  server-04 = mkNixosSystem {
    system = "x86_64-linux";
    modules = [
      ./server/04
      server
      shared
    ];
  };
}
