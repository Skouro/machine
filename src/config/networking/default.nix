_: with _; {
  firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 8000; to = 8010; }
    ];
  };
}
