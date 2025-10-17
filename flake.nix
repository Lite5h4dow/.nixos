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
      # url = "nixpkgs/nixos-25.05";
      url = "nixpkgs/nixos-unstable";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };

    nix-on-droid-pkgs = {
      url = "nixpkgs/nixos-24.05";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nix-on-droid-pkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
    };

    atuin = {
      url = "github:atuinsh/atuin";
    };

    systems = {
      url = "github:nix-systems/x86_64-linux";
    };

    wallpapers = {
      flake = false;
      url = "git+https://git.litelot.us/litelotus/.wallpapers";
      # url = "git+file:///home/lotus/.wallpapers";
    };

    ags-config = {
      # flake = false;
      # url = "git:litelotus/.ags";
      url = "git+https://git.litelot.us/litelotus/.ags";
      # url = "git+file:///home/lotus/.ags";
      # url = "git+https://github.com/d7omdev/ags";
      # url = "git+https://github.com/gitmeED331/agsv2";
      # url = "github:PierreBorine/ags-config";
    };

    custom-uboot = {
      url = "https://git.litelot.us/litelotus/u-boot.git";
      flake = false;
    };

    wrapper-manager = {
      url = "github:viperML/wrapper-manager";
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

    hyprshell = {
      url = "github:h3rmt/hyprshell";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    swww.url = "github:LGFae/swww";

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
      url = "github:justchokingaround/lobster";
      # url = "github:eatmynerds/lobster-rs";
      # inputs = {
      #   nixpkgs.follows = "nixpkgs";
      # };
    };

    stylix = {
      url = "github:danth/stylix";
      # inputs = {
      #   nixpkgs.follows = "nixpkgs";
      #   home-manager.follows = "home-manager";
      #   flake-compat.follows = "flake-compat";
      #   flake-utils.follows = "flake-utils";
      # };
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };

    polymc = {
      url = "github:PolyMC/PolyMC";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    "tinygo-machine" = {
      url = "github:tinygo-org/tinygo";
      flake = false;
    };

    vscode-server= {
      url = "github:nix-community/nixos-vscode-server";
    };
  };
}
