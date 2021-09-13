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
    networks = {
      "INTERYA_CARMEN" = {
        psk = "mesa_3256";
      };
      Amaya = {
        psk = "solaremix2AA";
      };
    };
    interfaces = [
      "wlp0s20f3"
    ];
  };

}
