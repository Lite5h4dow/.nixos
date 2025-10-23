{pkgs, inputs, lib, ...}:let
  # atuin-desktop-overrided = pkgs.atuin-desktop.overrideAttrs {
  #   version = "0.1.7";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "atuinsh";
  #     repo = "desktop";
  #     tag = "v0.1.7";
  #     # hash = lib.fakeHash;
  #     hash = "sha256-FDwCdxNKiQbWfzIbd6nQc6r6yDRGK4lzKPWtw8y9L9A=";
  #   };
  #   cargoHash = lib.fakeSha256;
  # };
  atuin-desktop-patched = pkgs.symlinkJoin{
    name ="atuin-desktop";
    paths = [
      # atuin-desktop-overrided
      pkgs.atuin-desktop
    ];
    nativeBuildInputs = [ pkgs.makeBinaryWrapper ];
    postBuild =''
      wrapProgram $out/bin/atuin-desktop \
      --set "WEBKIT_DISABLE_DMABUF_RENDERER" "1"
    '';
  };
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
    atuin-desktop-patched
    inputs.zen-browser.packages.${system}.default
    inputs.polymc.packages.${system}.default
    # inputs.freecad-patch.legacyPackages.${system}.freecad-wayland

  ];
}
