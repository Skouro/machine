_: with _; {
  desktopManager = {
    gnome = {
      enable = true;
    };
  };
  displayManager = {
    lightdm = {
      enable = true;
    };
  };
  enable = true;
  layout = "us";
  libinput = {
    enable = true;
  };
  updateDbusEnvironment = true;
  xkbVariant = "altgr-intl";
}
