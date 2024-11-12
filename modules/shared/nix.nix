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
    };

    registry = {
      nixpkgs.flake = nixpkgs;
      n.flake = nixpkgs;
      default.flake = nixpkgs;
    };

    channel.enable = false;

    nixPath = [
      "nixpkgs=${nixpkgsPath}"
      "n=${nixpkgsPath}"
      "default=${nixpkgsPath}"
    ];
  };
}
