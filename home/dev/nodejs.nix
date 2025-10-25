{pkgs, ...}:{
  home.packages = with pkgs; [
    bun
    yarn
    deno
    pnpm
    sass
    nodejs
    prisma
    typescript
    nodePackages_latest.nodemon
  ];
}
