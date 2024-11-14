{ config, ... }: let
  inherit (config.values) mainUser;
in {
  imports = [inputs.nixos-wsl.nixosModules.default];

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
