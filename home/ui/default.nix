{pkgs, inputs, ...}:{
  imports = [
    ./mpv
    ./ags
    ./rofi
    ./ghostty
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
    inputs.zen-browser.packages.${system}.default
    inputs.stable-pkgs.legacyPackages.${system}.blender-hip
    inputs.stable-pkgs.legacyPackages.${system}.orca-slicer
    postman
    freecad-wayland
    kicad
  ];
}
