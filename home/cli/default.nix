{osConfig, pkgs, lib, inputs, ...}:let
  inherit (lib) optional;
  inherit (osConfig.custom) minimal; 
in{
  imports = [
    ./starship

    ./fish
    ./bash.nix

    ./helix
    ./yazi.nix

  ] ++ optional (!minimal) [
    ./jerry.nix
  ]
  ;

  home ={
    packages = with pkgs; [
      eza
      ouch
      aria2
    ]
    ++ optional (!minimal) [
      neovim
      neofetch
      ytermusic
      csvtool
    ]

    ;

    sessionVariables = {
      "KUBE_CONFIG_PATH" = "~/.kube/config";
    };
  };
}
