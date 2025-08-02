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
      ouch
      aria2
    ]
    ++ optionals (!minimal)[
      du-dust
      dua
      ripgrep
      ripgrep-all
    ]
    ++ optionals (!minimal && !corp) [
      neovim
      neofetch
      ytermusic
      csvtool
      ffmpeg
      yt-dlp
      # mullvad
      # inputs.atuin.packages.${system}.atuin
    ];

    sessionVariables = {
      "KUBE_CONFIG_PATH" = "~/.kube/config";
    };
  };
}
