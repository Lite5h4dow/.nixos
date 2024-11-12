{
  flakePkgs,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./binds.nix
    ./exec.nix
  ];

  home.packages = with pkgs; [
    hyprpicker # https://github.com/hyprwm/hyprpicker
    gammastep # https://gitlab.com/chinstrap/gammastep
    flakepkgs.hyprwm-contrib.grimblast # https://github.com/hyprwm/contrib/blob/main/grimblast/grimblast.1.scd
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;

    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };
}
