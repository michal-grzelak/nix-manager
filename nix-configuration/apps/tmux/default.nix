{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.tmux = {
    enable = true;
    shell = "${definitions.homeDirectory}/.nix-profile/bin/${definitions.shellToUse}";
  };
}
