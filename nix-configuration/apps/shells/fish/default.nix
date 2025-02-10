{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.fish = {
    enable = true;

    shellInit = ''
      # disable greeting
      set -U fish_greeting;
    '';
    interactiveShellInit = ''
      # test
    '';

    plugins = [
      # this plugin sets nix env on path in fish shell
      {
        name = "nix";
        src = pkgs.fetchFromGitHub {
          name = "nix.fish";
          owner = "kidonng";
          repo = "nix.fish";
          rev = "HEAD";
          sha256 = "sha256-GMV0GyORJ8Tt2S9wTCo2lkkLtetYv0rc19aA5KJbo48=";
        };
      }
      # set gh copilot alias
      {
        name = "gh-copilot-cli-alias";
        src = pkgs.fetchFromGitHub {
          name = "gh-copilot-cli-alias.fish";
          owner = "rcny";
          repo = "gh-copilot-cli-alias.fish";
          rev = "HEAD";
          sha256 = "sha256-MATTLflWYWMINdA3wBSrB520oDpgbEtmJg6SitYjbmE=";
        };
      }

    ];
  };
}
