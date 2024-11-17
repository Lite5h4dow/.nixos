{ config, ... }:let
inherit (config.lib.stylix) colors;
in {
  home.file = {
    "./.config/shared/theme.test" = {
      text = colors.withHashtag;
      executable = false;
    };
  };
}
