{pkgs, ...}:{
  custom = {
    minimal = true;
    mobile.enable = false;
    boot.enable = true;
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
