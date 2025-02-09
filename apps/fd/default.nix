{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.fd = {
    enable = true;

    hidden = true;
  };
}
