{
  config,
  lib,
  pkgs,
  lib',
  ...  
}: let
  cfg = config.custom.tailscale;
  inherit (lib) types mkOption mkEnableOption;
in{
  options = {
    custom.tailscale = {
      enable = mkEnableOption {
        description = "Enable Tailscale Module";
        type = types.bool;
        default = false;
      };

      useRoutingFeatures = mkOption {
        description = "default tailscale routing options to use";
        type = types.enum ["none" "client" "server" "both"];
        default = "none";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = cfg.useRoutingFeatures;
      # extraSetFlags = [
        # "--login-server=https://ts.litelot.us"
      # ];
    };
    networking.nftables.enable = true;
  };
}
