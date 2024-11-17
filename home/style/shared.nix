{ config, ... }:let
  inherit (config.lib.stylix) colors;
  inherit (builtins)readFile;
in {

  home.file = {
    ".config/shared/theme.yaml" = {
      text = readFile(colors.withHashtag);
      executable = false;
    };
  };
}
