{lib'}: let
  inherit (lib') mkNixosSystem mkNixOnDroidSystem;

  modulePath = ../modules;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  server = modulePath + /server;
  wsl = modulePath + /wsl;
  nix-on-droid = modulePath + /nix-on-droid;
  raspberry-pi = modulePath + /raspberry-pi;

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

  nix-on-droid = mkNixOnDroidSystem {
    system = "aarch64-linux";
    modules = [
      ./nix-on-droid
      nix-on-droid
      shared
    ];
  };
}
