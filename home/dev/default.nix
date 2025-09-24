{lib, pkgs, osConfig, inputs, ...}:let
  inherit (osConfig.custom) podman minimal;
  inherit (lib) optionals mkIf;
  inherit (inputs) unstable-pkgs;

  gcloud = pkgs.google-cloud-sdk.withExtraComponents [
    pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
  ];
in{
  imports = [
    ./git.nix
    ./nodejs.nix
    ./lsp-ai.nix
  ]
  ++optionals (!minimal) [
    ./wireshark.nix
  ]
  ;

  programs = {
    go = {
      enable = true;
    };
  };
 home={
   packages = with pkgs; [
      gnumake
      python3
      usbutils
      dfu-util
      clang-tools
    ]
    ++ optionals (!minimal) [
      zig
      k9s
      ruby
      gcloud
      tinygo
      fractal
      kubectl
      teleport
      popsicle
      pico-sdk
      opentofu
      protobuf
      netcoredbg
      dotnet-sdk
      mermaid-cli
      android-tools
      woodpecker-cli
      gcc-arm-embedded
      kubectl-validate
      dotnetPackages.Nuget
      rubyPackages.solargraph
      (wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-git
          helm-s3
        ];
      })
      unstable-pkgs.legacyPackages.${system}.pulumi-bin
      # pulumiPackages.pulumi-go
      # pulumiPackages.pulumi-nodejs
    ]
    ;

    file = {
      ".config/containers/config.json" = mkIf podman.enable {
        text = ''
          {
            "credHelpers": {
              "gcr.io": "gcloud",
              "us.gcr.io": "gcloud",
              "eu.gcr.io": "gcloud",
              "asia.gcr.io": "gcloud",
              "staging-k8s.gcr.io": "gcloud",
              "marketplace.gcr.io": "gcloud",
              "asia-docker.pkg.dev":  "gcloud",
              "asia-east1-docker.pkg.dev": "gcloud",
              "asia-east2-docker.pkg.dev":  "gcloud",
              "asia-northeast1-docker.pkg.dev": "gcloud",
              "asia-northeast2-docker.pkg.dev":  "gcloud",
              "asia-northeast3-docker.pkg.dev": "gcloud",
              "asia-south1-docker.pkg.dev":  "gcloud",
              "asia-south2-docker.pkg.dev": "gcloud",
              "asia-southeast1-docker.pkg.dev":  "gcloud",
              "asia-southeast2-docker.pkg.dev": "gcloud",
              "australia-southeast1-docker.pkg.dev":  "gcloud",
              "australia-southeast2-docker.pkg.dev": "gcloud",
              "europe-docker.pkg.dev":  "gcloud",
              "europe-central2-docker.pkg.dev": "gcloud",
              "europe-north1-docker.pkg.dev":  "gcloud",
              "europe-southwest1-docker.pkg.dev": "gcloud",
              "europe-west1-docker.pkg.dev":  "gcloud",
              "europe-west10-docker.pkg.dev": "gcloud",
              "europe-west12-docker.pkg.dev":  "gcloud",
              "europe-west2-docker.pkg.dev": "gcloud",
              "europe-west3-docker.pkg.dev":  "gcloud",
              "europe-west4-docker.pkg.dev": "gcloud",
              "europe-west6-docker.pkg.dev":  "gcloud",
              "europe-west8-docker.pkg.dev": "gcloud",
              "europe-west9-docker.pkg.dev":  "gcloud",
              "me-central1-docker.pkg.dev": "gcloud",
              "me-central2-docker.pkg.dev":  "gcloud",
              "me-west1-docker.pkg.dev": "gcloud",
              "northamerica-northeast1-docker.pkg.dev":  "gcloud",
              "northamerica-northeast2-docker.pkg.dev": "gcloud",
              "southamerica-east1-docker.pkg.dev":  "gcloud",
              "southamerica-west1-docker.pkg.dev": "gcloud",
              "us-docker.pkg.dev":  "gcloud",
              "us-central1-docker.pkg.dev": "gcloud",
              "us-east1-docker.pkg.dev":  "gcloud",
              "us-east4-docker.pkg.dev": "gcloud",
              "us-east5-docker.pkg.dev":  "gcloud",
              "us-south1-docker.pkg.dev": "gcloud",
              "us-west1-docker.pkg.dev":  "gcloud",
              "us-west2-docker.pkg.dev": "gcloud",
              "us-west3-docker.pkg.dev":  "gcloud",
              "us-west4-docker.pkg.dev": "gcloud"
            }
          }
        '';
      };
    };
  };
}
