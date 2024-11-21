{pkgs, config, lib, ...}:let
  cfg = config.custom.tailscale;
  inherit (lib) mkIf;
in {
  config = mkIf cfg.enable {
    home.package = with pkgs; [
      trayscale
    ];
  };
}
