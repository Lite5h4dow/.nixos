{
  pkgs,
  lib,
  ...
}: {
  environment = {
    defaultPackages = lib.mkForce [];
    binsh = lib.getExe pkgs.dash;

    systemPackages = with pkgs; [
      dash
      htop
      man-pages
      man-pages-posix
      fd # https://github.com/sharkdp/fd
      cht-sh # https://cheat.sh/
      duf # https://github.com/muesli/duf
      jaq # https://github.com/01mf02/jaq
      wget
      nh # https://github.com/viperML/nh
      ripgrep # https://github.com/BurntSushi/ripgrep
      nix-tree
      nix-inspect
      yazi
    ];
  };
}
