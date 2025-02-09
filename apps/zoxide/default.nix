{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.zoxide = {
    enable = true;

    options = [
      "--cmd cd"
    ];
  };
}
