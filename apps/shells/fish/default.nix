{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_greeting;
    '';
    plugins = [
      # this plugin sets nix env on path in fish shell
      {
        name = "nix.fish";
        src = pkgs.fetchFromGitHub {
          owner = "kidonng";
          repo = "nix.fish";
          rev = "HEAD";
          sha256 = "sha256-GMV0GyORJ8Tt2S9wTCo2lkkLtetYv0rc19aA5KJbo48=";
        };
      }
    ];
  };
}
