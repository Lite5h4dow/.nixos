{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) nixpkgs;  
  nixpkgsPath = nixpkgs.outPath;
in {
  nix = {
    package = pkgs.lix;

    settings = {
      accept-flake-config = true;
      warn-dirty = true;
      trusted-users = ["root" "@wheel"];

      auto-optimise-store = true;
      builders-use-substitutes = true;

      experimental-features = ["nix-command" "flakes"];
      # default-flake = nixpkgs;
      log-lines = 30;
      http-connections = 50;

      substituters=[
        "https://cache.nixos.org/"
      ];
    };

    registry = {
      nixpkgs.flake = nixpkgs;
      n.flake = nixpkgs;
      default.flake = nixpkgs;
    };

    channel.enable = false;

    gc ={
      automatic = true;
      options = "--delete-older-than 7d";
    };

    nixPath = [
      "nixpkgs=${nixpkgsPath}"
      "n=${nixpkgsPath}"
      "default=${nixpkgsPath}"
    ];
  };
  # system.autoUpgrade = {
  #   enable = true;
  #   flake = inputs.self.outPath;
    
  # };

  systemd.services.nix-daemon.environment.TMPDIR = "/var/tmp/nix-daemon";
}
