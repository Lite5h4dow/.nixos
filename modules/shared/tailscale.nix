{
  config,
  lib,
  pkgs,
  lib',
  ...  
}: let
  cfg = config.custom.tailscale;
in{
  options = {
    custom.tailscale.enable = lib.mkEnableOption "Enable Tailscale Module";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = cfg.useRoutingFeatures;
      extraSetFlags = [
        "--login-server=https://ts.litelot.us"
      ];
    };
    networking.nftables.enable = true;
  };
}
