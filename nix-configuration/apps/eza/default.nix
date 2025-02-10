{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.eza = {
    enable = true;

    extraOptions = [
      "--color=always"
      "--git"
      "--icons=always"
      "--header"
      "--group"
      "--time-style=long-iso"
      "--group-directories-first"
    ];
  };
}
