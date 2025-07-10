{lib, ...}:let
  inherit (lib) mkOption types;
in{
  options = {
    custom.corporate = {
      enable = mkOption {
        type = types.bool;
        description = "Modify config for corpo environment";
        default = false;
      };
    };
  };
}
