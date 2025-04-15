{lib', inputs}:let
  inherit (lib') mkNixOnDroidSystem;

  modulePath = ../../modules;
  shared = modulePath + /shared;
  nix-on-droid = modulePath + /nix-on-droid;
in{
  phone = mkNixOnDroidSystem {
    system = "aarch64-linux";
    modules = [
      ./phone
      nix-on-droid
      shared
    ];
  };

  # vr = mkNixOnDroidSystem {
  #   system = "aarch64-linux";
  #   modules = [
  #     ./vr
  #     nix-on-droid
  #     shared
  #   ];
  # };
}
