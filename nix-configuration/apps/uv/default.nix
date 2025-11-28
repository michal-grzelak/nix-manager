{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  programs.uv = {
    enable = true;
  };
}
