{
  description = "My universal NixOS configuration"
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
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    wrapper-manager = {
      url = "github:viperML/wrapper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    flake-compat.url = "github:edolstra/flake-compat";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    ags = {
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

        searx-randomizer.inputs = {
          crane.follows = "crane";
          flake-parts.follows = "flake-parts";
          nixpkgs.follows = "nixpkgs";
        };
      };
    };
  };
}
