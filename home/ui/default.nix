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
    vscode
    (pkgs.bottles.override{removeWarningPopup = true;})
    neovide
    remmina
    grayjay
    ferdium
    fractal
    nautilus
    qFlipper
    filezilla
    mullvad-vpn
    prusa-slicer
    freecad-wayland
    gimp-with-plugins
    libreoffice-fresh
    inputs.zen-browser.packages.${system}.default
    inputs.stable-pkgs.legacyPackages.${system}.blender-hip
    inputs.polymc.packages.${system}.default

    
    # (pkgs.symlinkJoin {
    #   name = "KiCAD";
    #   paths = [ pkgs.kicad ];
    #   buildInputs = [ pkgs.makeWrapper ];
    #   postBuild = ''
    #       wrapProgram $out/bin/kicad \
    #       --set __GLX_VENDOR_LIBRARY_NAME mesa \
    #       --set __EGL_VENDOR_LIBRARY_FILENAMES ${pkgs.mesa}/share/glvnd/egl_vendor.d/50_mesa.json
    #   '';
    #   meta.mainProgram = "KiCAD";
    # })
  ];
}
