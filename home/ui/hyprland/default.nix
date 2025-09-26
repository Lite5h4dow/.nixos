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

  systemd.user.sockets.swww = {
    Unit = {
      Description = "starting swww-daemon as a service";
    };
    Socket = {
      ListenStream= "%t/wayland-0";
    };
  };

  systemd.user.services.swww = {
    Unit = {
      Description = "starting swww-daemon as a service";

      Requires = "swww.socket";
      After = "swww.socket";
      Before = "graphical-session.target";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "sleep 5 && ${swww}/bin/swww-daemon";
    };
  };
}
