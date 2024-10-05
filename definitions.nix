{ lib, ... }:
let
  username = builtins.getEnv "USER";
  homeDirectory = builtins.getEnv "HOME";
  system = builtins.currentSystem;

  linuxArm = "aarch64-linux";
  linuxPc = "x86_64-linux";
  macArm = "aarch64-darwin";
  macPc = "x86_64-darwin";

  supportedSystems = [
    linuxArm
    linuxPc
    macArm
    macPc
  ];

  isArm = builtins.elem system [
    linuxArm
    macArm
  ];
  isPc = builtins.elem system [
    linuxPc
    macPc
  ];
  isLinux = builtins.elem system [
    linuxArm
    linuxPc
  ];
  isMac = builtins.elem system [
    macArm
    macPc
  ];

in
# fail at unsupported system to avoid issues
assert lib.asserts.assertOneOf "system" system supportedSystems;
{
  inherit username homeDirectory system;
  inherit
    isArm
    isPc
    isLinux
    isMac
    ;
}
