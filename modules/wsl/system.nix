{ config, inputs, ... }: let
  inherit (config.values) mainUser;
in {
  imports = [inputs.nixos-wsl.nixosModules.default];

  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  wsl.enable = true;
  wsl.defaultUser = mainUser;
  wsl.docker-desktop.enable = true;
  wsl.interop.register = true;
}
