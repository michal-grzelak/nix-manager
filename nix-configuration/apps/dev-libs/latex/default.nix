{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  home.packages = with pkgs; [
    # formatter
    tex-fmt
  ];
}
