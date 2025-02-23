{config, lib, ...}: let
  inherit (config.values) mainUser;
  inherit (config.custom) nvidia docker podman;
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
        default = false;
      };
    };
  };

  config = mkIf podman.enable {
    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = docker.enable;
        enableNvidia = podman.nvidia;
        dockerSocket.enable = true;
        autoPrune.enable = true;
      };

      oci-containers.backend = "podman";
    };

    users.users.${mainUser}.extraGrops = ["podman"];

    hardware.nvidia-container-toolkit.enable = podman.nvidia;
  };
}
