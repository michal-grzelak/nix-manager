{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{

  home = {
    packages = with pkgs; [
      mongodb-tools
    ];
  };
}
