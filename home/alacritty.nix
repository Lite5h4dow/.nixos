{osConfig, ...}:{
  programs.alacritty = {
    enable = true;
    settings = {
      ipc_socket = osConfig.values.terminal.firstInstance != null;
      live_config_reload = true;

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
