{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.yt-dlp = {
    enable = true;
  };
}
