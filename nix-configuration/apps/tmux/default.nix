{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  imports = [ ./shells ];

  programs.tmux = {
    enable = true;
  };
}
