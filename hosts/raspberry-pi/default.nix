{...}:{
  custom = {
    mobile.enable = false;
    boot.enable = false;
    fish.enable = false;
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
    tailscale.enable = true;
  };
}
