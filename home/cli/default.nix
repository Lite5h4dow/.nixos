{osConfig, pkgs, lib, inputs, ...}:let
  inherit (lib) optionals;
  inherit (osConfig.custom) minimal corporate; 
  corp = corporate.enable;
in{
  imports = [
    ./starship

    ./fish
    ./atuin
    ./zoxide
    ./bash.nix

    ./helix
    ./yazi.nix

  ] ++ optionals (!minimal) [
    ./jerry.nix
  ];

  home ={
    packages = with pkgs; [
      fd
      bat
      eza
      ouch
      aria2
      ripgrep
    ]
    ++ optionals (!minimal && !corp) [
      neovim
      neofetch
      ytermusic
      csvtool
      ffmpeg
      yt-dlp
      # inputs.atuin.packages.${system}.atuin
    ];

    sessionVariables = {
      "KUBE_CONFIG_PATH" = "~/.kube/config";
    };
  };
}
