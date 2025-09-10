{pkgs, inputs, ...}: let
  # ouchPath = inputs."ouch.yazi".outPath;
in {
  home.packages = with pkgs; [
    ouch
  ];
  
  programs.yazi = {
    enable = true;
    plugins = {
      inherit (pkgs.yaziPlugins) 
        ouch
        wl-clipboard
        sudo
        starship
        rsync
        git
        chmod
        yatline-catppuccin
        ;
    };
  };
}
