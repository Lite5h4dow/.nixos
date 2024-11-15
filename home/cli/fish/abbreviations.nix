{osConfig, ...}: let
  cursor = expansion: {
    setCursor = true;
    inherit expansion;
  };

in {
  programs.fish.shellAbbrs = {
    hash = "sha256sum";
    copy = "wl-copy";
    paste = "wl-paste";
    mp = "mkdir -p";
    page = "$PAGER";
    open = "xdg-open";
    size = "du -sh";
    "-" = "cd -";
    # anime = "mpv --profile=anime";
    cht = "cht.sh";

    sc = "systemctl";
    jc = "journalctl";
    scu = "systemctl --user";
    jcu = "journalctl --user";


    # nix
    n = "nix";
    ne = "cd ~/.nixos";
    clean = "nh clean all --keep ${toString osConfig.boot.loader.systemd-boot.configurationLimit}";
    shell = "nix shell";
    dev = "nix develop --command fish";
    run = "nix run";
    build = "nix build";
    flake = "nix flake";
    update = "nix flake update";
    repl = "nix repl --expr 'import <nixpkgs> {}'";
    bloat = "nix path-info -Sh /run/current-system";
    unfree = cursor "NIXPKGS_ALLOW_UNFREE=1 % --impure";
    insecure = cursor "NIXPKGS_ALLOW_INSECURE=1 % --impure";
    broken = cursor "NIXPKGS_ALLOW_BROKEN=1 % --impure";
    rebuild = "sudo nixos-rebuild switch --flake ~/.nixos#";

    # git
    g = "git";
    lg = "lazygit";
    gc = "git commit";
    gp = "git push";
    gl = "git pull";
    gst = "git status";
    grhh = "git reset --hard";
    gb = "git branch";
    gm = "git merge";
    gfa = "git fetch --all";
    gpf = "git push --force";
    gco = "git checkout";
    gd = "git diff";
    gs = "git switch";
    gsc = "git switch --create";
    ga = "git add";
    "ga." = "git add .";
    gf = "git fetch";

    # configs
    ags-config = "hx ~/Projects/ags-config";
  };
}
