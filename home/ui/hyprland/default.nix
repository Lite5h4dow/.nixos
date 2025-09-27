{ flakePkgs, inputs, pkgs, ... }:let
    inherit(inputs.swww.packages.${pkgs.system}) swww;
in {
  imports = [
    ./config.nix
    ./binds.nix
    ./exec.nix
    ./xdph.nix
    ./hyprshell.nix
  ];

  home.packages = with pkgs; [
    swww
    cliphist
    hyprpicker # https://github.com/hyprwm/hyprpicker
    flakePkgs.hyprwm-contrib.grimblast # https://github.com/hyprwm/contrib/blob/main/grimblast/grimblast.1.scd
  ];

  # programs.dconf.enable = true;
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
      provider = "geoclue2";
    };
  };

  systemd.user={
    enable= true;
    services.swww = {
      Unit = {
        Description = "starting swww-daemon as a service";
        After = "hyprland-session.target";
      };
      Install ={
        WantedBy = ["graphical-session.target"];
      };
      Service = {
        Restart = "always";
        RestartSec = 5;
        ExecStart = "${swww}/bin/swww-daemon";
      };
    };
  };
}
