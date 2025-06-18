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
    vscode
    (pkgs.bottles.override{removeWarningPopup = true;})
    neovide
    remmina
    fractal
    filezilla
    # inputs.zen-browser.packages.${system}.default
    inputs.stable-pkgs.legacyPackages.${system}.blender-hip
    inputs.polymc.packages.${system}.default
    # postman
    qFlipper
    freecad-wayland
    # orca-slicer
    gimp-with-plugins
    libreoffice-fresh
    onlyoffice-desktopeditors

    # (orca-slicer.overrideAttrs(oldAttrs: {
    #   cmakeFlags = oldAttrs.cmakeFlags ++ [
    #     (lib.cmakeFeature "CUDA_TOOLKIT_ROOT_DIR" "${cudaPackages.cudatoolkit}")
    #   ];
    # }))
    # super-slicer

    (pkgs.symlinkJoin {
      name = "KiCAD";
      paths = [ pkgs.kicad ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
          wrapProgram $out/bin/kicad \
          --set __GLX_VENDOR_LIBRARY_NAME mesa \
          --set __EGL_VENDOR_LIBRARY_FILENAMES ${pkgs.mesa.drivers}/share/glvnd/egl_vendor.d/50_mesa.json
      '';
      meta.mainProgram = "KiCAD";
    })

    # (pkgs.symlinkJoin {
    #   name = "OrcaSlicer";
    #   paths = [ pkgs.orca-slicer ];
    #   buildInputs = [ pkgs.makeWrapper];
    #   postBuild = ''
    #       wrapProgram $out/bin/kicad \
    #       --set __GLX_VENDOR_LIBRARY_NAME mesa \
    #       --set __EGL_VENDOR_LIBRARY_FILENAMES ${pkgs.mesa.drivers}/share/glvnd/egl_vendor.d/50_mesa.json
    #   '';
    #   meta.mainProgram = "OrcaSlicer";
    # })
  ];
}
