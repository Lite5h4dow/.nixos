{pkgs, ...}:{
  home.packages = with pkgs; [
    nodejs
    yarn
    typescript
    bun
    deno
    pnpm

    prisma
    # prismaPackages."@prisma/language-server"

    sass
    # scss-lint
    nodePackages_latest.nodemon
    # nodePackages_latest.prisma

    # vscode-extensions.prisma.prisma
  ];

  # home.sessionVariables = with pkgs; {
  #   PRISMA_MIGRATION_ENGINE_BINARY = "${prisma-engines}/bin/schema-engine";
  #   PRISMA_QUERY_ENGINE_BINARY ="${prisma-engines}/bin/query-engine";
  #   PRISMA_QUERY_ENGINE_LIBRARY="${prisma-engines}/lib/libquery_engine.node";
  #   PRISMA_INTROSPECTION_ENGINE_BINARY="${prisma-engines}/bin/introspection-engine";
  #   PRISMA_FMT_BINARY="${prisma-engines}/bin/prisma-fmt";
  # };
}
