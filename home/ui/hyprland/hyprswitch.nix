{inputs, system, ...}:let
  hyprswitch = inputs.hyprswitch.packages.${system}.default;
in{
  home.packages = [
    hyprswitch
  ];
}
