{config, lib, ...}: let
  inherit (config) values;
in {
  custom = {
    boot.enable = false;
    fish.enable = true;
    atuin.enable = true;
    networking = {
      enable = false;
    };
    virtualisation={
      qemu = {
        enable = true;
        ui.enable = false;
        quickemu.enable = false;
      };
    };
  };

  users.groups.docker = {};
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "dotnet-sdk-6.0.428"
  ];

  system.stateVersion = "25.05";
}
