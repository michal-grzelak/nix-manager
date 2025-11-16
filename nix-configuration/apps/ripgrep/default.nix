{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  programs.ripgrep = {
    enable = true;
  };
}
