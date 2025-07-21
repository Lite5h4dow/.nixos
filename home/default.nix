{lib, osConfig}:let
  inherit (osConfig.custom) minimal server;
  inherit (lib) optionals;
in{
  imports = [
    ./cli
    ./dev

    # user home config
    ./user.nix
  ] ++ optionals (!server.enable && !minimal) [
    ./ui
    ./style
    ./video
    ./photo
  ];

  services= {
    gnome-keyring = {
      enable = true;
    };
  };
}
