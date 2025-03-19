{config, lib, ...}: let
  inherit (config) values;
in {
  custom = {
    boot.enable = false;
    mobile.enable = false;
    fish.enable = true;
    graphics = {
      intel.enable = false;
      nvidia.enable = false;
    };
    bluetooth.enable = false;
    tailscale.enable = false;
    networking = {
      enable = false;
    };
    virtualisation={
      qemu = {
        enable = true;
        ui = false;
        quickEmu = {
          enable = false;
        };
      };
    };
    # gaming = {
    #   enable = false;
    #   xr.enable = false;
    # };
  };

  users.groups.docker = {};
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "dotnet-sdk-6.0.428"
  ];

  system.stateVersion = "24.11";
}
