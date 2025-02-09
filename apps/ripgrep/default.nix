{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.ripgrep = {
    enable = true;
  };
}
