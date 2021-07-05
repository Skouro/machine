_: with _; {
  desktopManager = {
    gnome = {
      enable = true;
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
  updateDbusEnvironment = true;
  xkbVariant = "altgr-intl";
}
