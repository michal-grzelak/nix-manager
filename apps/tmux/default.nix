{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.tmux = {
    enable = true;
    shell = "${definitions.homeDirectory}/.nix-profile/bin/${definitions.shellToUse}";
  };
}
