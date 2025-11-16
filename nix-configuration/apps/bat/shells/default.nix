{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  imports = [./fish.nix];
}
