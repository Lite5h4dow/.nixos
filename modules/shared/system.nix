{pkgs, ...}:{
  # time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_US.UTF-8";
  # console.keymap = "us";
  # networking.nameservers = [1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4];
  environment = {
    variables = {
      EDITOR = "hx";
    };
    enableAllTerminfo = true;
    systemPackages = with pkgs; [
      gcc
      glib
      glibc
      glibmm
      glibtool
    ];
  };

  programs = {
    fuse = {
      enable = true;
      userAllowOther = true;
    };
    nh ={
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 3d --keep 2";
      };
    };
  };
}
