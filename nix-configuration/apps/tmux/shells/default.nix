{
  pkgs,
  common,
  lib,
  config,
  ...
}: let
  inherit (common) utils;
in {
  imports = [./fish.nix];
}
