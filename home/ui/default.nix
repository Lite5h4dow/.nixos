{pkgs, ...}:{
  imports = [
    ./mpv
    ./ags
    ./rofi
    # ./anyrun
    ./hyprland
    ./lens.nix
    ./taxi.nix
    ./iwgtk.nix
    ./mqttx.nix
    ./dunst.nix
    ./vscode.nix
    ./fractal.nix
    ./nixcord.nix
    ./swayimg.nix
    ./remmina.nix
    ./blender.nix
    ./hypridle.nix
    ./trayscale.nix
    ./alacritty.nix
    ./schizofox.nix
    ./zed-editor.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    neovide
    # orca-slicer
    # postman
  ];
}
