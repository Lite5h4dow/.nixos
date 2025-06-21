{config, pkgs, lib,...}:let
  kubeMasterIP = "192.168.10.1";
  kubeMasterHostname = "01-server";
  kubeMasterAPIPort = 6443;

  inherit (lib) types mkOption mkEnableOption optional mkIf;
  inherit (config.custom.server) k8s;
in{
  options = {
    custom.server.k8s = {
      enable = mkEnableOption {
        description = "Enable Kubernetes on this server";
        type = types.bool;
        default = false;
      };
      isMaster = mkOption {
        description = "Is this node a master node?";
        type = types.bool;
        default = false;
      };
    };
  };

  config ={
    networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

    environment.systemPackages = with pkgs;[
      kompose
      kubectl
      kubernetes
      openssl
      cfssl
      certmgr
    ];

    services.kubernetes = let
      api = "https://${kubeMasterIP}:${toString kubeMasterAPIPort}";
    in{
      roles = [ "node" ]
      ++ optional k8s.isMaster "master";

      masterAddress = kubeMasterIP;

      apiserverAddress = api;
      kubelet.kubeconfig.server =
        mkIf (!k8s.isMaster) api;

      apiserver = mkIf k8s.isMaster{
        securePort = kubeMasterAPIPort;
        advertiseAddress = kubeMasterIP;
      };

      # easyCerts = true;
      addons.dns.enable = true;
      kubelet.extraOpts = "--fail-swap-on=false";
    };
  };
}
