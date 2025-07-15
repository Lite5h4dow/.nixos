{config, lib, inputs, ...}: let
  inherit (config) values;
in {
  import = [
    inputs.vscode-server.default
  ];

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

  services = {
    services.vscode-server.enable = true;
    tailscale = {
      enable = true;
    };
  };

  system.stateVersion = "25.05";
}
