{pkgs, inputs, ...}: let
  ouchPath = inputs."ouch.yazi".outPath;
in {
  home.packages = with pkgs; [
    # ueberzugpp 
    ouch
  ];
  
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        reveal = [
          {
            run = "exiftool \"$1\" | $PAGER";
            block = true;
            desc = "Show EXIF";
            for = "unix";
          }
        ];
        play = [
          {
            run = "mpv \"$@\"";
            orphan = true;
            for = "unix";
          }
          {
            run = "mediainfo \"$1\" | $PAGER";
            block = true;
            desc = "Show media info";
            for = "unix";
          }
        ];
      };
    };
  };

  home.file.".config/yazi/plugins/ouch.yazi" = {
    recursive = false;
    source = ouchPath;
  };
}
