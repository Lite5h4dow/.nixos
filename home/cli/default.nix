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
      zip
      rar
      neovim
      csvtool
      steam-run
      ytermusic
      aria2
      inputs.lobster.packages.${pkgs.system}.lobster-rs
      inputs.curd.packages.${pkgs.system}.default
      neofetch
    ];

    sessionVariables = {
      "KUBE_CONFIG_PATH" = "~/.kube/config";
    };
  };
}
