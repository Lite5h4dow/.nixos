{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) nixpkgs;  
  nixpkgsPath = nixpkgs.outPath;
  inherit (config.values) mainUser;
  inherit(lib) mkOption types;
in {
  options={
    custom.rebuildName = mkOption{
      description = "flake rebuild name";
      type = types.str;
      default = null;
    };
  };

  config={
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
        extra-substituters = [
          "https://hyprland.cachix.org"
        ];
        extra-trusted-substituters=[
          "https://hyprland.cachix.org"
          "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];
        extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];
      };

      registry = {
        nixpkgs.flake = nixpkgs;
        n.flake = nixpkgs;
        default.flake = nixpkgs;
      };

      channel.enable = false;

      # gc ={
      #   automatic = true;
      #   options = "--delete-older-than 7d";
      # };

      nixPath = [
        "nixpkgs=${nixpkgsPath}"
        "n=${nixpkgsPath}"
        "default=${nixpkgsPath}"
      ];
    };
    programs = {
      nix-ld ={
        enable = true;
        libraries = with pkgs;[
          atk
          nss
          gtk3
          cups
          dbus
          nspr
          glibc
          libGL
          pango
          cairo
          expat
          libdrm
          libgbm
          alsa-lib
          gdk-pixbuf
          libxkbcommon
          xorg.libxcb
          xorg.libX11
          xorg.libXext
          xorg.libXfixes
          xorg.libXrandr
          xorg.libXdamage
          xorg.libXcomposite
        ];
      };
    };

    environment.variables ={
      LD_LIBRARY_PATH = lib.mkDefault "$LD_LIBRARY_PATH:${pkgs.glibc}/lib";
    };
    users.users= {
      "root" = {
        initialPassword = "toor";
      };
      ${mainUser}={
        extraGroups = [
          "dialout"
        ];
      };
    };

    # system.autoUpgrade = {
    #   enable = true;
    #   flake = inputs.self.outPath;
    
    # };

    systemd.services.nix-daemon.environment.TMPDIR = "/var/tmp/nix-daemon";
  };
}
