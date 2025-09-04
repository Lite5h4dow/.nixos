{osConfig, lib, ...}: let
  username = osConfig.values.mainUser;
  inherit (lib) mkDefault;
in{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = mkDefault "25.05";
  };

  programs.rclone ={
    remotes = {
      "fs" = {
        mounts = {
          "/" = {
            enable = true;
            mountPoint = "/home/${username}/fs";
            options = {
              dir-cache-time = "5s";
              poll-interval = "5s";
              vfs-cache-mode = "writes";
              allow-other = true;
            };
          };
        };
      };
    };
  };

}
