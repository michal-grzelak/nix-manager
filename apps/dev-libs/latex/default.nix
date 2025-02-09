{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  home.packages = with pkgs; [
    # formatter
    tex-fmt
  ];
}
