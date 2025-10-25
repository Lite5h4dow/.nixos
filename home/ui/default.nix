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
    freecad
    fractal
    pureref
    qFlipper
    blender-hip
    mullvad-vpn
    zen-browser'
    prusa-slicer
    youtube-music
    atuin-desktop'
    # freecad-wayland
    gimp-with-plugins
    libreoffice-fresh
  ];
}
