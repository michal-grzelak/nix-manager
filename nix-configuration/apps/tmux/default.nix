{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  imports = [./shells];

  programs.tmux = {
    enable = true;
  };
}
