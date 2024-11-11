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

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    jerry = {
      url = "github:justchokingaround/jerry";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };
}
