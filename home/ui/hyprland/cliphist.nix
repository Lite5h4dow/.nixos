{pkgs, ...}:let
  mod = "SUPER";
in{
  services.cliphist={
    enable = true;
    package = pkgs.cliphist;
  };
  wayland.windowManager.hyprland.settings={
    bind = [
      "${mod}, v, exec, rofi -modi clipboard:${pkgs.cliphist}/bin/cliphist-rofi-img -show clipboard"
    ];
  };
}
