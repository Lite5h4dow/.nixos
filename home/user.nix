{osConfig, lib, ...}: let
  username = osConfig.values.mainUser;
  inherit (lib) mkDefault;
in{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = mkDefault "25.05";
  };

}
