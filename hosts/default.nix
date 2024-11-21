{lib'}: let
  inherit (lib') mkNixosSystem mkNixOnDroidSystem;

  modulePath = ../modules;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  server = modulePath + /server;
  wsl = modulePath + /wsl;
  nix-on-droid = modulePath + /nix-on-droid;

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

  nix-on-droid = mkNixOnDroidSystem {
    system = "aarch64-linux";
    modules = [
      ./nix-on-droid
      nix-on-droid
      shared
    ];
  };
}
