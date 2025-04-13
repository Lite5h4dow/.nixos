{lib, osConfig}:let
  inherit (osConfig.custom) minimal;
  inherit (lib) optionals;
in{
  imports = [
    ./ui
    ./cli
    ./dev
    ./style
    ./video

    # user home config
    ./user.nix
  ];
}
