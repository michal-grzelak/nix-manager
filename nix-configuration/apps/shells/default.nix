{
  pkgs,
  lib,
  common,
  config,
  ...
}: let
  inherit (common) utils;
in {
  imports = [
    ./fish.nix
  ];

  programs.bash = lib.mkIf (config.definitions.isLinux
    == true) {
    enable = lib.mkDefault true;

    initExtra = lib.mkBefore ''
      source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    '';
  };
}
