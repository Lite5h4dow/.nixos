{config, lib, pkgs, ...} : let
  inherit (config) values;
in {
  custom = {
    mobile.enable = false;
    boot.enable = false;
    graphics = {
      intel.enable = false;
      nvidia.enable = false;
    };
    podman = {
      enable = true;
    };
    docker.enable = false;
    bluetooth.enable = true;
    networking = {
      hostName = "glacier-pi";
      useDHCP = true;
      wireless.enable = true;
    };
    virtualisation = {
      qemu.enable = false;
      ui.enable = false;
    };
    tailscale.enable = true;
    gaming.enable = false;
  };
}
