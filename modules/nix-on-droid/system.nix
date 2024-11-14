{ config, inputs, ...}: let
  inherit (config.values) mainUser;
in {
  imports = [inputs.nix-on-droid.nixosModules.default];

  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };
}
