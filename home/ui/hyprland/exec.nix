{
  lib,
  osConfig,
  ...
}:{
  wayland.windowManager.hyprland.settings = {
    exec-once =
      [
        "[workspace 1] firefox"
        "gammastep -l 47.1625:19.5033 -t 6500K:2600K"
        "ags run"
      ]
      ++ lib.optional (osConfig.values.terminal.firstInstance != null) "[workspace special:terminal silent] ${osConfig.values.terminal.firstInstance}";
  };
}
