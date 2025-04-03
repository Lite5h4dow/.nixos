{
  flakePkgs,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./binds.nix
    ./exec.nix
    ./xdph.nix
    ./hyprswitch.nix
  ];

  home.packages = with pkgs; [
    cliphist
    hyprpicker # https://github.com/hyprwm/hyprpicker
    gammastep # https://gitlab.com/chinstrap/gammastep
    flakePkgs.hyprwm-contrib.grimblast # https://github.com/hyprwm/contrib/blob/main/grimblast/grimblast.1.scd
    geoclue2
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };
}
