{pkgs, inputs, ...}:{
  imports = [
    ./mpv
    ./ags
    ./rofi
    ./hyprland
    ./dunst.nix
    ./nixcord.nix
    ./swayimg.nix
    ./hypridle.nix
    ./trayscale.nix
    ./alacritty.nix
    ./schizofox.nix
    ./zed-editor.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    taxi
    lens
    mqttx
    iwgtk
    vscode
    neovide
    remmina
    fractal
    filezilla
    inputs.blender-pkgs.legacyPackages.${system}.blender-hip
    orca-slicer
    postman
  ];
}
