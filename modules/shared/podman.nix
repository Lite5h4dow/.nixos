{config, pkgs, lib, ...}: let
  inherit (config.values) mainUser;
  inherit (config.custom) graphics docker podman;
  inherit (graphics) nvidia;
  inherit (lib) types mkEnableOption mkOption mkIf optional;
in {
  options = {
    custom.podman ={
      enable = mkEnableOption {
        description = "Enable Podman module";
        type = types.bool;
        default = false;
      };

      wsl = mkOption {
        default = false;
        type = types.bool;
      };

      nvidia = mkOption {
        description = "Enable nvidia tools for podman";
        type = types.bool;
        default = nvidia.enable;
      };
    };
  };

  config = mkIf podman.enable (let
     podman-wsl' = pkgs.symlinkJoin {
      name = "podman";
      paths = [pkgs.podman];
      nativeBuildInputs = [pkgs.makeBinaryWrapper];
      postBuild = ''
        wrapProgram $out/bin/podman --add-flags "-r"
      '';
     };
    in{
    virtualisation = {
      podman = {
        enable = true;
        package = optional podman.wsl podman-wsl';
        dockerCompat = !docker.enable;
        dockerSocket.enable = !docker.enable;
        autoPrune.enable = true;
      };


      oci-containers.backend = "podman";
    };

    environment.systemPackages = with pkgs;[
      podman-compose
    ];

    users.users.${mainUser}.extraGroups = ["podman"];

    hardware.nvidia-container-toolkit.enable = podman.nvidia;
  });
}
