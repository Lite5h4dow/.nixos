{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  inherit (config.values) mainUser;
  inherit (config.custom.graphics) nvidia;
  inherit (lib) types;
  cfg = config.custom.docker;
in {
  options = {
    custom.docker = {
      enable = lib.mkEnableOption {
       description = "Enable the Docker Module";
       type = types.bool;
       default = false;
      };

      nvidia = lib.mkOption {
        description = "Enable Nvidia container toolkit for docker";
        type = types.bool;
        default = nvidia.enable;
      };
    };
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

    hardware.nvidia-container-toolkit.enable = cfg.nvidia;
  };
}
