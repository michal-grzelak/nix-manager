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
  programs.tmux = lib.mkIf (config.definitions.shellToUse == "fish") {
    shell = "${pkgs.fish}/bin/fish";
  };
}
