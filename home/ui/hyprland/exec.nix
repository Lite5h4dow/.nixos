{
  lib,
  osConfig,
  ...
}:{
  wayland.windowManager.hyprland.settings = {
    exec-once =
      [
        "ags run &"
        "[workspace 1] zen"
        "hyprswitch init &"
        "iwgtk -i &"
        "trayscale --hide-window &"
        "ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false &"
      ]
      ++ lib.optional (osConfig.values.terminal.firstInstance != null) "[workspace special:terminal silent] ${osConfig.values.terminal.firstInstance}";
  };

}
