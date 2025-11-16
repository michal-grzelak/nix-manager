{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  imports = [
    ./nix-lib
    ./latex
    ./ngrok
  ];
}
