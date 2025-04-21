{pkgs, osConfig, lib, ...}:let
  inherit (lib) mkIf;
  inherit (osConfig.custom) minimal;
in {
  config = mkIf (!minimal) {
    home.packages = with pkgs;[
      ansel
    ];
  };
}
