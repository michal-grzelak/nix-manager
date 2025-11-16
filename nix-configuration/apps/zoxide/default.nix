{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  programs.zoxide = {
    enable = true;

    options = [
      "--cmd cd"
    ];
  };
}
