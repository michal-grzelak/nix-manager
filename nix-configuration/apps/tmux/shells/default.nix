{
  pkgs,
  common,
  lib,
  config,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  imports = [ ./fish.nix ];
}
