{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.fish = {
    interactiveShellInit = ''
      #  source batman (using batman plugin as man pager)
      batman --export-env | source
    '';
  };
}
