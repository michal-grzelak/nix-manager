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
    ./${definitions.shellToUse}
  ];
}
