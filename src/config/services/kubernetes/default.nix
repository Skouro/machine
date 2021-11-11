_: with _; {
  roles = [ "master" "node" ];
  masterAddress = abs.kubeMasterHostname;
  apiserverAddress = "https://${abs.kubeMasterHostname}:${toString abs.kubeMasterAPIServerPort}";
  easyCerts = true;
  apiserver = {
    securePort = abs.kubeMasterAPIServerPort;
    advertiseAddress = abs.kubeMasterIP;
  };

  # use coredns
  addons.dns.enable = true;

  # needed if you use swap
  kubelet.extraOpts = "--fail-swap-on=false";
}
