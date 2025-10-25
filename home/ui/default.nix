{pkgs, inputs, ...}:let
  atuin-desktop' = pkgs.symlinkJoin{
    name ="atuin-desktop";
    paths = [
      pkgs.atuin-desktop
    ];
    nativeBuildInputs = [ pkgs.makeBinaryWrapper ];
    postBuild =''
      wrapProgram $out/bin/atuin-desktop \
      --set "WEBKIT_DISABLE_DMABUF_RENDERER" "1"
    '';
  };
  freecad' = pkgs.symlinkJoin{
    name = "freecad";
    paths = [
      pkgs.freecad
    ];
    nativeBuildInputs = [pkgs.makeBinaryWrapper];
    postBuild = ''
      wrapProgram $out/bin/freecad \
      --set "QT_QPA_PLATFORM" "xcb"
      wrapProgram $out/bin/FreeCAD \
      --set "QT_QPA_PLATFORM" "xcb"
    '';
  };
  zen-browser' = inputs.zen-browser.packages.${pkgs.system}.default;
  polymc' =  inputs.polymc.packages.${pkgs.system}.default;
  bottles' = (pkgs.bottles.override{removeWarningPopup = true;});
in{
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
    lens
    mqttx
    kicad
    vscode
    polymc'
    neovide
    bottles'
    remmina
    grayjay
    ferdium
    fractal
    pureref
    freecad'
    qFlipper
    blender-hip
    mullvad-vpn
    zen-browser'
    prusa-slicer
    youtube-music
    atuin-desktop'
    gimp-with-plugins
    libreoffice-fresh
  ];
}
