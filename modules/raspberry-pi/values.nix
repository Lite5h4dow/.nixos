{ lib, ... }: let
  inherit (lib) mkOption types;
in {
  options = {
    values = {
      mainUser = mkOption {
        description = "The name of the main user";
        type = types.str;
        default = "lotus";
      };
    };
  };
}

