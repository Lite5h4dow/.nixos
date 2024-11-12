{
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
}
