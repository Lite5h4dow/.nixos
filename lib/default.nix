{
  inputs,
  lib',
}: let
  getPkgs = input: system:
    if (input.legacyPackages.${system} or {}) == {}
    then input.packages.${system}
    else input.legacyPackages.${system};

  # Builders
  mkNixosSystem = args @ {system, nixpkgs ? inputs.nixpkgs, ...}:
    nixpkgs.lib.nixosSystem {
      system = null;
      specialArgs = {
        inherit inputs;
      };

      modules = [
        {
          _module.args = {
            inherit system lib';
            flakePkgs = builtins.mapAttrs (_: value: getPkgs value system) inputs;
          };

          nixpkgs = {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              # inputs.prisma.overlay
            ];
          };
        }
      ]
      ++ args.modules or [];
    };

  mkNixOnDroidSystem = args @ {system, nixpkgs ? inputs.nixpkgs, ...}:
    inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs {
        system= system;
        overlays = [
          inputs.nix-on-droid.overlays.default
        ];
      };
      modules = [
        {
          _module.args = {
            inherit system lib';
            flakePkgs = builtins.mapAttrs (_: value: getPkgs value system) inputs;
          };
        }
      ]
      ++ args.modules or [];

    };

  wrapProgram = {
    pkgs,
    package,
    executable ? null,
    binaryWrapper ? true,
    wrapperArgs,
  }: let
    package' = 
      if builtins.isString package
      then pkgs.${package}
      else package;

    wrapper =
      if binaryWrapper
      then pkgs.makeBinaryWrapper
      else pkgs.makeWrapper;

    file =
      if executable != null
      then executable
      else package'.meta.mainProgram;
  in
    pkgs.symlinkJoin {
      name = "${package'.pname}-wrapped";
      paths = [package'];

      nativeBuildInputs = [wrapper];
      postBuild = "wrapProgram $out/bin/${file} ${pkgs.lib.escapeShellArgs wrapperArgs}";
    };

  #Helpers
  overrideError = pkg: version: value: 
    pkg.lib.throwIf(pkg.lib.versionOlder version pkg.version) 
    "A new version of ${pkg.pname} has been released, remove its overlay/override 🤞" 
    value;

  pow = base: exponent:
    if exponent == 0
    then 1
    else if exponent == 1
    then base
    else base * (pow base (exponent - 1));

  shiftLeft = number: amount: number * (pow 2 amount);

  mapListToAttrs = func: list: builtins.listToAttrs(map func list);
in{
  inherit mkNixosSystem mkNixOnDroidSystem wrapProgram overrideError shiftLeft mapListToAttrs;
}
