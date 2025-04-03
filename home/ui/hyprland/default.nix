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
    flakePkgs.hyprwm-contrib.grimblast # https://github.com/hyprwm/contrib/blob/main/grimblast/grimblast.1.scd
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };

  services ={
    gammastep ={
      enable = true;
    };
    geoclue2 = {
      enable = true;
    };
  };
}
