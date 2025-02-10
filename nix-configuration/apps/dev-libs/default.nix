{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  imports = [
    ./nix-lib
    ./latex
  ];
}
