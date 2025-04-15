{osConfig, pkgs, lib, inputs, ...}:let
  inherit (lib) optionals;
  inherit (osConfig.custom) minimal; 
in{
  imports = [
    ./starship

    ./fish
    ./bash.nix

    ./helix
    ./yazi.nix

  ] ++ optionals (!minimal) [
    ./jerry.nix
  ];

  home ={
    packages = with pkgs; [
      eza
      ouch
      aria2
    ]
    ++ optionals (!minimal) [
      neovim
      neofetch
      ytermusic
      csvtool
      ffmpeg
    ];

    sessionVariables = {
      "KUBE_CONFIG_PATH" = "~/.kube/config";
    };
  };
}
