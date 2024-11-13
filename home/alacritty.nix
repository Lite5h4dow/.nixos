{osConfig, lib, ...}:let
  inherit (lib) mkForce;
in{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        ipc_socket = osConfig.values.terminal.firstInstance != null;
        live_config_reload = true;
      };

      font.size = mkForce 10;
      window = {
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
