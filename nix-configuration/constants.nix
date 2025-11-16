{lib, ...}: let
  linuxArm = "aarch64-linux";
  linuxPc = "x86_64-linux";
  macArm = "aarch64-darwin";
  macPc = "x86_64-darwin";

  stateVersion = "25.11";

  supportedSystems = [
    linuxArm
    linuxPc
    macArm
    macPc
  ];
in {
  systems = {
    inherit
      linuxArm
      linuxPc
      macArm
      macPc
      ;
  };
  inherit supportedSystems;

  inherit stateVersion;
}
