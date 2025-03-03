{config, lib, ...}: let
  inherit (config.values) mainUser;
  inherit (config.custom) graphics docker podman;
  inherit (graphics) nvidia;
  inherit (lib) types mkEnableOption mkOption mkIf;
in {
  options = {
    custom.podman ={
      enable = mkEnableOption {
        description = "Enable Podman module";
        type = types.bool;
        default = false;
      };

      nvidia = mkOption {
        description = "Enable nvidia tools for podman";
        type = types.bool;
        default = nvidia.enable;
      };
    };
  };

  config = mkIf podman.enable {
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = docker.enable;
        dockerSocket.enable = true;
        autoPrune.enable = true;
      };

      oci-containers.backend = "podman";
    };

    users.users.${mainUser}.extraGroups = ["podman"];

    hardware.nvidia-container-toolkit.enable = podman.nvidia;
  };
}
