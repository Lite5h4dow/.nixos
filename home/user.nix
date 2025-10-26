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
    enable = true;
    remotes = {
      "filestore" = {
        mounts = {
          "/" = {
            enable = true;
            mountPoint = "/home/${username}/filestore";
            options = {
              dir-cache-time = "5s";
              poll-interval = "5s";
              vfs-cache-mode = "writes";
              allow-other = true;
            };
          };
        };
        config = {
          type = "webdav";
          vendor = "owncloud";
          url = "https://fs.litelot.us";
          user = "litelotus";
        };
        secrets = {
          password = "/home/${username}/.filestore-pass";
        };
      };
    };
  };
}
