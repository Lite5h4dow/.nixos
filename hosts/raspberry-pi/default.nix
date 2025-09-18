{...}:{
  custom = {
    minimal = true;
    mobile.enable = false;
    boot.enable = false;
    fish.enable = false;
    graphics = {
      intel.enable = false;
      nvidia.enable = false;
    };
    ssh= {
      enable = true;
      allowRoot = true;
    };
    podman = {
      enable = true;
    };
    docker.enable = false;
    bluetooth.enable = true;
    networking = {
      # hostName = "glacier-pi";
      useDHCP = true;
      wireless.enable = true;
    };
    tailscale.enable = true;
  };
}
