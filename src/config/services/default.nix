_: with _; {
  xserver = {
    desktopManager = {
      gnome = {
        enable = true;
        extraGSettingsOverrides = ''
        '';
      };
    };
    displayManager = {
      gdm = {
        enable = true;
      };
    };
    enable = true;
    layout = "us";
    libinput = {
      enable = true;
    };
    xkbVariant = "altgr-intl";
  };
}
