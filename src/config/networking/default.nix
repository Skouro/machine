_: with _; {
  firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 8000; to = 8010; }
    ];
  };
  networkmanager = {
    enable = false;
  };
  wireless = {
    enable = true;
    networks = { };
    interfaces = [
      "wlp0s20f3"
    ];
  };

}
