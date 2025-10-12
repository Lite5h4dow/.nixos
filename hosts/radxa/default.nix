{pkgs, ...}:{
  custom = {
    minimal = true;
    mobile.enable = false;
    boot.enable = false;
    fish.enable = true;
    graphics = {
      intel.enable = false;
      nvidia.enable = false;
    };

    ssh = {
      enable = true;
      allowRoot = true;
    };
    podman.enable = true;
    docker.enable = false;
    tailscale.enable = true;
  };
}
