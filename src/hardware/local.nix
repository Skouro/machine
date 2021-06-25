# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/af459c0e-fe31-4c7d-8e69-5ed168848146";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/2f7e7640-4b78-4452-88e7-ad5935ac61af";

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/24196bc6-004e-46dd-ac16-f0c184008d9f";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."cryptnix".device = "/dev/disk/by-uuid/510fea1f-1bfc-4456-a328-06ae7000ebc4";

  fileSystems."/nix/store" =
    { device = "/nix/store";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/E89E-4224";
      fsType = "vfat";
    };

  fileSystems."/eph" =
    { device = "/dev/disk/by-uuid/16eeb42e-d4bc-40cb-b2ed-71531985b288";
      fsType = "ext4";
    };

  fileSystems."/data" =
    { device = "/dev/disk/by-uuid/927ddd70-c78d-4393-8279-483218f7b39c";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."cryptdata".device = "/dev/disk/by-uuid/840336b1-cc61-4e65-a9d2-af80a9335bf8";

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
