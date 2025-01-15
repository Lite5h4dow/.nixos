#this flake config is heavilly based off: https://github.dev/diniamo/niqs
{
  description = "My universal NixOS configuration";
  outputs = inputs: let
    lib' = import ./lib {
      inherit inputs lib';
    };
  in {
    nixosConfigurations = import ./hosts {
      inherit lib';
    };
  };

  inputs = {
    nixpkgs = {
      # url = "nixpkgs/nixos-unstable";
      # url = "github:NixOS/nixpkgs/nixos-unstable";
      url = "github:NixOs/nixpkgs/nixos-24.11";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    systems = {
      url = "github:nix-systems/x86_64-linux";
    };

    wallpapers = {
      flake = false;
      url = "git+https://git.litelot.us/litelotus/.wallpapers";
    };

    ags-config = {
      flake = false;
      # url = "git+https://git.litelot.us/litelotus/ags-config.git";
      url = "git+https://git.litelot.us/litelotus/ags-config?ref=AGS-V2";
    };

    wrapper-manager = {
      url = "github:viperML/wrapper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    # prisma = {
    #   url = "github:pimeys/nixos-prisma";
    # };

    flake-compat.url = "github:edolstra/flake-compat";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      # url = "github:Aylur/ags/v1";
      url = "github:Aylur/ags";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.flake-parts.follows = "flake-parts";
    };

    jerry = {
      url = "github:justchokingaround/jerry";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    lobster = {
      url = "github:justchokingaround/lobster";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
      };
    };

    schizofox = {
      url = "github:schizofox/schizofox";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        home-manager.follows = "home-manager";
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";

        # searx-randomizer.inputs = {
        #   crane.follows = "crane";
        #   flake-parts.follows = "flake-parts";
        #   nixpkgs.follows = "nixpkgs";
        # };
      };
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    "ouch.yazi" = {
      flake = false;
      url = "github:ndtoan96/ouch.yazi";
    };
  };
}
