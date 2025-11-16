{
  pkgs,
  lib,
  common,
  config,
  ...
}: let
  inherit (common) utils;
in {
  programs.fish = lib.mkIf (config.definitions.shellToUse == "fish") {
    interactiveShellInit = ''
      #  source batman (using batman plugin as man pager)
      batman --export-env | source
    '';
  };
}
