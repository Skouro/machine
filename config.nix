let
  machine = import ./default.nix;
  audio = {
    pulseaudio = {
      enable = true;
    };
  };
in
{
  imports = [
    machine.hardware
    machine.software
  ];
}
