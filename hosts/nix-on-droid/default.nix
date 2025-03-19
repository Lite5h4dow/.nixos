  nix-on-droid = mkNixOnDroidSystem {
    system = "aarch64-linux";
    modules = [
      ./nix-on-droid
      nix-on-droid
      shared
    ];
  }
