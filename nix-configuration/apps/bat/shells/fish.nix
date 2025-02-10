{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.fish = {
    interactiveShellInit = ''
      #  source batman (using batman plugin as man pager)
      batman --export-env | source
    '';
  };
}
