{inputs, ...}:{
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];
  programs.hyprshell = {
    enable = true;
    settings = {
      windows = {
        enable = true;
        overview = {
          enable = true;
          key="tab";
          modifier="super";
        };
        switch = {
          enable = true;
        };
      };
    };
  };
}
