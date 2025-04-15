{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.bash = {
    enable = true;

    initExtra = ''
      exec fish
    '';
  };

  imports = [
    ./${definitions.shellToUse}
  ];
}
