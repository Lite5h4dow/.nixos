{ config, ... }:let
inherit (config.lib.stylix) colors;
inherit (builtins) toJSON readFile;
in {
  home.file = {
    "./.config/shared/theme.test" = {
      text = toJSON(readFile(colors.withHashtag));
      executable = false;
    };
  };
}
