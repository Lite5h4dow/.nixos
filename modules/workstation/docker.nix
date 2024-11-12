{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  inherit (config.values) mainUser;
  inherit (config.custom) nvidia;
  cfg = config.custom.docker;
in {
  options = {
    custom.docker.enable = lib.mkEnableOption "Enable the Docker Module";
  };

  config = lib.mkIf cfg.enable {
    virtualisation = {
      docker.enable = true;
      oci-containers = {
        backend = "docker";
        containers = {};
      };
    };
    users.users.${mainUser}.extraGroups = ["docker"];

    hardware.nvidia-container-toolkit.enable = nvidia.enable;
  };
}
