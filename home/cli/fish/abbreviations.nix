{osConfig, ...}: let
  cursor = expansion: {
    setCursor = true;
    inherit expansion;
  };

  nixUpdateCommand = "sudo nixos-rebuild switch --option build-dir /var/tmp/nix-daemon";
  nixGenerationCleanupCommand  = "sudo nix-collect-garbage -d";
  update-command =  a:"${nixUpdateCommand} ~/.nixos#${a}";
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
    cht = "cht.sh";

    sc = "systemctl";
    jc = "journalctl";
    scu = "systemctl --user";
    jcu = "journalctl --user";


    # nix
    n = "nix";
    ne = "cd ~/.nixos";
    clean = "nh clean all --keep 2";
    shell = "nix shell";
    dev = "nix develop --command fish";
    run = "nix run";
    build = "nix build";
    flake = "nix flake";
    nfu = "nix flake update";
    repl = "nix repl --expr 'import <nixpkgs> {}'";
    bloat = "nix path-info -Sh /run/current-system";
    unfree = cursor "NIXPKGS_ALLOW_UNFREE=1 % --impure";
    insecure = cursor "NIXPKGS_ALLOW_INSECURE=1 % --impure";
    broken = cursor "NIXPKGS_ALLOW_BROKEN=1 % --impure";
    "nixrb" = update-command osConfig.custom.rebuildName;

    #pulumi
    p = "pulumi";
    pu = "pulumi up";
    pd = "pulumi dn";
    pn = "pulumi new";

    # git
    g = "git";
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
    gf = "git fetch";
    gu = "git commit && git push";

    # configs
    ags-config = "cd ~/Projects/ags-config";
  };
}
