{config, lib, inputs, pkgs, ...}: let
  inherit (config) values;
in {
  imports = [
    inputs.vscode-server.nixosModules.default
  ];

  custom = {
    corporate.enable = true;
    boot.enable = false;
    fish.enable = true;
    atuin.enable = true;
    podman.enable = true;
    networking = {
      enable = false;
    };
    ssh = {
      enable = true;
    };
    rebuildName = "corp-wsl";
  };

  users.groups.docker = {};
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "dotnet-sdk-6.0.428"
  ];

  programs.nix-ld.enable=true;

  services = {
    vscode-server={
      enable = true;
      enableFHS = true;
      extraRuntimeDependencies = with pkgs; [
        curl
        icu
        wget
      ];
    };
    tailscale = {
      enable = true;
    };
  };

  system.stateVersion = "25.05";
}
