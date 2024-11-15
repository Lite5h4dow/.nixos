{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  inherit (osConfig.values) terminal;
  inherit (config) scripts;

  hyprlandScripts = config.wayland.windowManager.hyprland.scripts;

  mod = "SUPER";
  ctrl = "CONTROL";
  alt = "ALT";
  shift = "SHIFT";
  secondary = ctrl;
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # core
      "${mod}, Return, exec, ${terminal.command}"
      "${mod}, q, killactive"

      # menus
      "${mod}, Space, exec, rofi -show drun"
      "${mod}${shift}, semicolon, exec, rofimoji"
      ", XF86PowerOff, exec, rofi -show p -modi p:'rofi-power-menu'"
      "${mod}${secondary}, b, exec, rofi-bluetooth"
      "${mod}${secondary}, Space, exec, ~/.config/ags/shared/scripts/sidebar.sh toggle-applauncher"

      # utils
      "${mod} ${shift}, p, pin"
      "${mod}, f, togglefloating"
      "${mod}, p, pseudo"
      "${mod}, s, togglesplit"
      
      

      # audio
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"
      # The stop function is pretty much useless, use it to restart the playing media instead
      ", XF86AudioStop, exec, playerctl position 0"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"      

      # special workspaces
      "${mod}${secondary}, Return, togglespecialworkspace, terminal_zen" 
      "${mod}, e, togglespecialworkspace, file_manager_tui"
      "${mod}${secondary}, e, togglespecialworkspace, file_manager_gui"

      # move focus
      "${mod}, h, movefocus, l"
      "${mod}, j, movefocus, d"
      "${mod}, k, movefocus, u"
      "${mod}, l, movefocus, r"

      # move window
      "${mod}${shift}, h, movewindow, l"
      "${mod}${shift}, j, movewindow, d"
      "${mod}${shift}, k, movewindow, u"
      "${mod}${shift}, l, movewindow, r"

      # select workspace
      "${mod}, 1, workspace, 1"
      "${mod}, 2, workspace, 2"
      "${mod}, 3, workspace, 3"
      "${mod}, 4, workspace, 4"
      "${mod}, 5, workspace, 5"
      "${mod}, 6, workspace, 6"
      "${mod}, 7, workspace, 7"
      "${mod}, 8, workspace, 8"
      "${mod}, 9, workspace, 9"
      "${mod}, 0, workspace, 10"

      # move window to workspace
      # dont follow
      "${mod}${shift}, 1, movetoworkspacesilent, 1"
      "${mod}${shift}, 2, movetoworkspacesilent, 2"
      "${mod}${shift}, 3, movetoworkspacesilent, 3"
      "${mod}${shift}, 4, movetoworkspacesilent, 4"
      "${mod}${shift}, 5, movetoworkspacesilent, 5"
      "${mod}${shift}, 6, movetoworkspacesilent, 6"
      "${mod}${shift}, 7, movetoworkspacesilent, 7"
      "${mod}${shift}, 8, movetoworkspacesilent, 8"
      "${mod}${shift}, 9, movetoworkspacesilent, 9"
      "${mod}${shift}, 0, movetoworkspacesilent, 10"
      # follow
      "${mod}${shift}${secondary}, 1, movetoworkspace, 1"
      "${mod}${shift}${secondary}, 2, movetoworkspace, 2"
      "${mod}${shift}${secondary}, 3, movetoworkspace, 3"
      "${mod}${shift}${secondary}, 4, movetoworkspace, 4"
      "${mod}${shift}${secondary}, 5, movetoworkspace, 5"
      "${mod}${shift}${secondary}, 6, movetoworkspace, 6"
      "${mod}${shift}${secondary}, 7, movetoworkspace, 7"
      "${mod}${shift}${secondary}, 8, movetoworkspace, 8"
      "${mod}${shift}${secondary}, 9, movetoworkspace, 9"
      "${mod}${shift}${secondary}, 0, movetoworkspace, 10"
    ];

    binde = [
      "${mod}${ctrl}, h, resizeactive, -50 0"
      "${mod}${ctrl}, j, resizeactive, 0 50"
      "${mod}${ctrl}, k, resizeactive, 0 -50"
      "${mod}${ctrl}, l, resizeactive, 50 0"

      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

      ", XF86MonBrightnessUp, exec, brightnessctl set 2%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 2%- -n"
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];
  };
}
