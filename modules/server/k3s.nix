{config, pkgs, lib, ...}:let
  k3sMasterIP = "192.168.10.1";

  inherit (lib) types mkOption mkEnableOption mkIf optional;
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

      role = mkOption{
        description = "server or agent";
        type = types.enum ["server" "agent"];
        default = "agent";
      };
    };
  };

  config = mkIf k3s.enable {
    services.k3s = {
      enable = true;
      role = if k3s.masterNode then "server" else k3s.role;
      clusterInit = k3s.masterNode;
      tokenFile = optional (!k3s.masterNode) "/var/k3s-token";
      serverAddr = optional (!k3s.masterNode) "https://${k3sMasterIP}:6443";
    };
  };
}
