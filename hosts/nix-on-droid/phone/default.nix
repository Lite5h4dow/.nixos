{config, lib, pkgs, ...}:let
  inherit (config) values;
in{
  custom = {
    minimal = true;
    boot.enable = false;
    fish.enable = true;
    mobile.enable = false;
    graphics ={
      intel.enable = false;
      nvidia.enable = false;
    };
    podman.enable = false;
    docker.enable = false;
    bluetooth.enable = false;
    tailscale.enable = false;
    virtualisation = {
      qemu.enable = false;
    };
    gaming.enable = false;
  };
}
