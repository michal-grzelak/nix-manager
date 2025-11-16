{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  programs.fd = {
    enable = true;

    hidden = true;
  };
}
