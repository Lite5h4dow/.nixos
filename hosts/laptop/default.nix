{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config) values;
in {
  imports = [./hardware.nix];

  networking.hostName = "${values.workstationName}";

  zramSwap.enable = true;

  # force audio to pulseaudio
  services.pipewire.enable = lib.mkForce false;
  hardware.pulseaudio.enable = true;

  custom = {
    xr.enable = true;
    nvidia.enable = true;
    mobile.enable = true;
    docker.enable = true;
    tailscale.enable = true;
  };

  home-manager.users.${values.mainUser} = {
    programs.mpv.config.ao = "pulse";
    programs.jerry.config.player_arguments = lib.mkForce "";
  };

  system.stateVersion = "24.05";
}
