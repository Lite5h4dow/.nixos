{pkgs, ...}:{
  imports = [
    # ./amd.nix
    ./intel.nix
    ./nvidia.nix
  ];

  environment.systemPackages = with pkgs; [
    libva-utils
    egl-wayland
  ];
}
