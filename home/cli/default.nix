{osConfig, pkgs, lib, inputs, ...}:let
  inherit (lib) optionals;
  inherit (osConfig.custom) minimal; 
in{
  imports = [
    ./starship

    ./fish
    ./atuin
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
      mermaid-cli
      # inputs.atuin.packages.${system}.atuin
    ];

    sessionVariables = {
      "KUBE_CONFIG_PATH" = "~/.kube/config";
    };
  };
}
