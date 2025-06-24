{config, pkgs, lib, ...}:let
  k3sMasterIP = "192.168.10.1";

  inherit (lib) types mkOption mkEnableOption mkIf;
  inherit (config.custom.server) k3s;
in{
  options = {
    custom.server.k3s = {
      enable = mkEnableOption {
        description = "enable kubernetes k3s";
        type = types.bool;
        default = false;
      };

      masterNode = mkOption {
        description = "make node master";
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf k3s.enable {
    enable = true;
  };
}
