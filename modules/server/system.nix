{config, inputs, ...}: let
  inherit (config.values) mainUser;
in {
  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
