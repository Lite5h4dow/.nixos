{pkgs, ...}:{
  home.packages = with pkgs; [
    nodejs
    typescript
    bun
    deno
    pnpm

    sass
    scss-lint
    nodePackages_latest.nodemon
  ];
}
