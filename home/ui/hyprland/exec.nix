{
  lib,
  osConfig,
  ...
}:{
  wayland.windowManager.hyprland.settings = {
    exec-once =
      [
        "swww-daemon"
        "ags run &"
        # "[workspace 1] zen"
        "iwgtk -i &"
        # "trayscale --hide-window &"
        "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false &"
        "wayvnc &"
      ]
      ++ lib.optional (osConfig.values.terminal.firstInstance != null) "[workspace special:terminal silent] ${osConfig.values.terminal.firstInstance}";
  };

}
