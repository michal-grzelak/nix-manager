{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  programs.yt-dlp = {
    enable = true;
  };
}
