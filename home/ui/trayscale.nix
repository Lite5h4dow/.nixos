{pkgs, osConfig, lib, ...}:let
  cfg = osConfig.custom.tailscale;
  inherit (lib) mkIf;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      trayscale
    ];
  };
}
