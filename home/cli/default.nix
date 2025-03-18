{pkgs, inputs, ...}:{
  imports = [
    ./fish
    ./helix
    ./starship

    ./bash.nix
    ./yazi.nix
    ./jerry.nix
  ];

  home ={
    packages = with pkgs; [
      eza
      ouch
      neovim
      csvtool
      ytermusic
      aria2
      neofetch
    ];

    sessionVariables = {
      "KUBE_CONFIG_PATH" = "~/.kube/config";
    };
  };
}
