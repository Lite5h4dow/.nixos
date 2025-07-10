{lib, ...}:let
  inherit (lib) mkEnableObtion types;
in{
  options = {
    custom.corporate = {
      enable = mkEnableObtion {
        type = types.bool;
        description = "Modify config for corpo environment";
        default = false;
      };
    };
  };
}
