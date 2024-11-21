{lib', inputs, nixpkgs}: let
  inherit (lib') mkNixosSystem;

  modulePath = ../modules;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  server = modulePath + /server;
  wsl = modulePath + /wsl;
  nix-on-droid = modulePath + /nix-on-droid;

in {
  imports = [inputs.nix-on-droid.nixosModules.default];
  
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

  nix-on-droid = nix-on-droid.lib.nixOnDroidConfiguration {
    # pkgs = import nixpkgs { system = "aarch64-linux"; };
    system = "aarch64-linux";
    modules = [
      ./nix-on-droid
      nix-on-droid
      shared
    ];
  };
}
