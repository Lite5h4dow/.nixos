{lib, ...}:let
  inherit (lib) mkObtion types;
in{
  options = {
    custom.corporate = {
      enable = mkObtion {
        type = types.bool;
        description = "Modify config for corpo environment";
        default = false;
      };
    };
  };
}
