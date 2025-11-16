{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  home.packages = with pkgs; [
    # formatter
    alejandra

    # language servers
    nil
    nixd
  ];
}
