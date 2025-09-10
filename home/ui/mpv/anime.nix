{...}: {
  programs.mpv.profiles.anime = {
    profile = [
      "best"
      "gpu-hq"
      "svp"
    ];

    sub-visibility = true;

    gpu-api = "auto";
    scale = "ewa_lanczossharp";
    dscale = "mitchell";
    linear-downscaling = false;
    correct-downscaling = true;
    cscale = "mitchell";

    scale-antiring = 0.7;
    dscale-antiring = 0.7;
    cscale-antiring = 0.7;

    deband = true;
    deband-iterations = 4;
    deband-threshold = 35;
    deband-range = 16;
    deband-grain = 4;
  };
}
