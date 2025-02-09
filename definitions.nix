{ lib, ... }:
let
  username = builtins.getEnv "USER";
  homeDirectory = builtins.getEnv "HOME";
  system = builtins.currentSystem;
  rootDir = builtins.getEnv "PWD";

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

  # setup shell you want to use here
  shellToUse = "fish";
in
# fail at unsupported system to avoid issues
assert lib.asserts.assertOneOf "system" system supportedSystems;
{
  inherit
    username
    homeDirectory
    system
    rootDir
    ;
  inherit
    isArm
    isPc
    isLinux
    isMac
    ;
  inherit shellToUse;
}
