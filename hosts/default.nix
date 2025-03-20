{lib', inputs}: let
  inherit (lib') mkNixosSystem;

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

  raspberry-pi = mkNixosSystem {
    system = "aarch64-linux";
    modules = [
      ./raspberry-pi
      raspberry-pi
      shared
    ];
  };


}
