{config, lib, ...}: let
  inherit (config) values;
in {
  custom = {
    corporate.enable = true;
    boot.enable = false;
    fish.enable = true;
    networking = {
      enable = false;
    };
  };

  users.groups.docker = {};
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "dotnet-sdk-6.0.428"
  ];

  system.stateVersion = "25.05";
}
