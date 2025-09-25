{inputs, system, ...}:let
  hyprshell = inputs.hyprshell.packages.${system}.default;
in{
  home.packages = [
    hyprshell
  ];
}
