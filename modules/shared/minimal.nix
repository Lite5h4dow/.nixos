{ lib, ...}:let
  inherit (lib) mkOption types;
in{
  options = {
    custom = {
      minimal = mkOption {
        description = "Only install the minimum packages needed for daily use";
        type = types.bool;
        default = false;
      };
    };
  };
}
