{osConfig, lib, ...}: let
  username = osConfig.values.mainUser;
  inherit (lib) mkDefault;
in{
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = mkDefault "24.05";
}
