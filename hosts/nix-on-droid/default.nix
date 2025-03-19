{lib'}:let
  inherit (lib') mkNixOnDroidSystem;

  modulePath = ../modules;
  shared = modulePath + /shared;
  nix-on-droid = modulePath + /nix-on-droid;
in{
  nix-on-droid = mkNixOnDroidSystem {
    system = "aarch64-linux";
    modules = [
      nix-on-droid
      shared
    ];
  }
}
