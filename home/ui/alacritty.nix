{osConfig, lib, config, ...}:let
  inherit (lib) mkForce;
  inherit (config.stylix) fonts;
in{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        ipc_socket = osConfig.values.terminal.firstInstance != null;
        live_config_reload = true;
      };

      font = {
        normal = {
          family = fonts.sansSerif.name;
        };
      };

      window = {
        opacity = mkForce 0.9;
        padding = {
          x = 5;
          y = 5;
        };
        dynamic_padding = true;
      };

      cursor = {
        style.shape = "Beam";
        vi_mode_style.shape = "Block";
      };

      mouse.hide_when_typing = true;
    };
  };
}
