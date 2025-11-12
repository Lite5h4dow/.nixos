{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.values) mainUser;
  inherit (config.custom) graphics docker podman;
  inherit (graphics) nvidia;
  inherit (lib)
    types
    mkEnableOption
    mkOption
    mkIf
    ;
in
{
  options = {
    custom.podman = {
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

  config = mkIf podman.enable ({
    virtualisation = {
      podman = {
        enable = true;
        package =
          if podman.wsl then
            pkgs.podman.overrideAttrs (oldAttrs: {
              buildInputs = oldAttrs.buildInputs or [ ] ++ [ pkgs.makeWrapper ];
              postInstall = oldAttrs.postInstall or "" + ''
                wrapProgram $out/bin/podman --add-flags "-r"
              '';
            })
          else
            pkgs.podman;
        dockerCompat = !docker.enable;
        dockerSocket.enable = !docker.enable;
        autoPrune.enable = true;
      };
      oci-containers.backend = "podman";
    };

    environment.systemPackages = with pkgs; [
      podman-compose
    ];

    users.users.${mainUser}.extraGroups = [ "podman" ];

    hardware.nvidia-container-toolkit.enable = podman.nvidia;
  });
}
