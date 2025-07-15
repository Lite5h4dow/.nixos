{config, lib, ...}: let
  inherit (config) values;
in {
  custom = {
    corporate.enable = true;
    boot.enable = false;
    fish.enable = true;
    atuin.enable = true;
    networking = {
      enable = false;
    };
  };

  users.groups.docker = {};
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "dotnet-sdk-6.0.428"
  ];

  home-manager.users.${values.mainUser} = {
    programs = {
      vscode = {
        enable = true;
      };
    };
  };

  services = {
    tailscale = {
      enable = true;
    };
  };

  system.stateVersion = "25.05";
}
