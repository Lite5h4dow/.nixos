{pkgs, ...}:{
  home.packages = with pkgs; [
    nodejs
    typescript
    bun
    deno
  ];
}
