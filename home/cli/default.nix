{pkgs, ...}:{
  imports = [
    ./fish
    ./helix
    ./starship

    ./bash.nix
    ./curd.nix
    ./yazi.nix
    ./jerry.nix
    ./lobster.nix
    ./csvtool.nix
    ./ytermusic.nix
    ./file-management.nix
    # ./ytui-music.nix
  ];

  home.packages = with pkgs; [
    neovim
    steam-run
  ];
}
