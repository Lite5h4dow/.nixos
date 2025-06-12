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
      plugin = {
        prepend_previewers = [
          { mime = "application/x-zip"; run = "ouch"; }
        	{ mime = "application/x-tar"; run = "ouch"; }
        	{ mime = "application/x-bzip2"; run = "ouch"; }
        	{ mime = "application/x-7z-compressed"; run = "ouch"; }
        	{ mime = "application/x-rar"; run = "ouch"; }
        	{ mime = "application/x-xz"; run = "ouch"; }
        ];
      };
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
        extract = [
          { run = "ouch d -y \"%*\""; desc = "Extract here with ouch"; for = "windows"; }
          { run = "ouch d -y \"$@\""; desc = "Extract here with ouch"; for = "unix"; }
        ];
      };
    };
    plugins = {
      # "ouch" = ouchPath;
    };
  };

  home.file.".config/yazi/plugins/ouch" = {
    enable = false;
    recursive = false;
    source = ouchPath;
  };
}
