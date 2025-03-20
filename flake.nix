#this flake config is heavilly based off: https://github.dev/diniamo/niqs
{
  description = "My universal NixOS configuration";
  outputs = inputs: let
    lib' = import ./lib {
      inherit lib' inputs;
    };
  in {
    images = import ./images {
      inherit lib' inputs;
    };

    nixosConfigurations = import ./hosts {
      inherit lib' inputs;
    };

    nixOnDroidConfigurations = import ./hosts/nix-on-droid {
      inherit lib' inputs;
    };
  };

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    stable-pkgs = {
      url = "nixpkgs/nixos-24.11";
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
    };

    systems = {
      url = "github:nix-systems/x86_64-linux";
    };

    wallpapers = {
      flake = false;
      url = "git:litelotus/.wallpapers";
    };

    ags-config = {
      flake = false;
      url = "git:litelotus/.ags";
      # url = "git+https://git.litelot.us/litelotus/.ags?ref=AGS-V2";
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

    hyprswitch = {
      url = "github:h3rmt/hyprswitch/release";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
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

    curd = {
        url = "github:Wraient/curd";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    lobster = {
      # url = "github:justchokingaround/lobster";
      url = "github:eatmynerds/lobster-rs";
      # inputs = {
      #   nixpkgs.follows = "nixpkgs";
      # };
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

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    "ouch.yazi" = {
      flake = false;
      url = "github:ndtoan96/ouch.yazi";
    };
  };
}
