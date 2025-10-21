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
    # ./schizofox.nix
    ./zed-editor.nix
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    nss
    taxi
    lens
    mqttx
    kicad
    dune3d
    vscode
    (pkgs.bottles.override{removeWarningPopup = true;})
    neovide
    blender-hip
    remmina
    grayjay
    ferdium
    fractal
    pureref
    qFlipper
    filezilla
    mullvad-vpn
    prusa-slicer
    freecad
    # freecad-wayland
    gimp-with-plugins
    libreoffice-fresh
    inputs.zen-browser.packages.${system}.default
    inputs.polymc.packages.${system}.default
    # inputs.freecad-patch.legacyPackages.${system}.freecad-wayland

  ];
}
