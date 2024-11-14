{ config, ... }: let
  inherit (config.values) mainUser;
in {
  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  imports = [
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = mainUser;
}
