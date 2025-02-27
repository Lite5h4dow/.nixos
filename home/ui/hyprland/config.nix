{
  osConfig, ...
}: let
  inherit (osConfig.values) terminal;
  # noDecorations = "gapsin:0, gapsOut:0, border:false, shadow:false, rounding:false, decorate:false";
  glacier-remmina-file = "~/.local/share/remmina/glacier-tailscale.remmina";
in {

  wayland.windowManager.hyprland.settings = {
    monitor = [", preferred, auto, 1"];
    env = [
      "XDG_SESSION_DESKTOP, Hyprland"

      "GDK_BACKEND, wayland"
      "SDL_VIDEODRIVER, wayland"
      # "QT_QPA_PLATFORM, wayland;xcb"
    ];

    input = {
      kb_layout = "us";
      kb_options = "caps:swapescape";
      follow_mouse = "1";

      accel_profile = "flat";
      scroll_method = "on_button_down";

      touchpad = {
        natural_scroll = true;
        # tap_to_click = true;
        # clickfinger_behaviour = true;
      };
    };

    general = {
      gaps_in = 5;
      gaps_out = 5;
    };

    decoration = {
      rounding = 5;
      blur = {
        enabled = true;
        size = true;
        passes = 1;
      };
    };

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

    xwayland = {
      force_zero_scaling = true;
    };

    misc = {
      middle_click_paste = false;
      focus_on_activate = true;

      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.1";

      animation = [
        "windows, 1, 5, myBezier, slidevert 10%"
        "windowsOut, 1, 5, default, slidevert 10%"
        "windowsMove, 1, 5, default, slidevert 10%"
        "fade, 1, 5, default"
        "border, 1, 5, default"
        "borderangle, 0, 8, default"
        "workspaces, 1, 5, myBezier"
        "specialWorkspace, 1, 5, myBezier, slidevert"
        "workspaces, 0"
        "specialWorkspace, 0"
      ];
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_cancel_ratio = 0.15;
    };

    binds = {
      allow_workspace_cycles = true;
    };

    workspace = [
      "special:terminal_zen, on-created-empty:${terminal.command}"
      "special:file_manager_gui, on-created-empty:thunar"
      "special:file_manager_tui, on-created-empty:yazi"
      "special:remote_desktop_gui, on-created-empty:remmina"
      "special:remote_desktop_glacier, on-created-empty:remmina -c ${glacier-remmina-file}"
    ];
  };
}
