_: with _; {
  groups = {
    docker = { };
  };
  mutableUsers = false;
  users = {
    root = {
      password = "1";
    };
    "${abs.username}" = {
      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
        "adbusers"
      ];
      home = abs.home;
      isNormalUser = true;
      password = "1";
    };
  };
}
