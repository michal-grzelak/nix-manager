{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  imports = [ ./shells ];

  programs.bat = {
    enable = true;

    extraPackages = with pkgs.bat-extras; [
      # display man with bat
      batman
      batgrep
    ];

    themes = {
      dracula = {
        src = pkgs.fetchFromGitHub {
          name = "apps-bat-Dracula.tmTheme";
          owner = "dracula";
          repo = "sublime"; # Bat uses sublime syntax for its themes
          rev = "v1.4.3";
          hash = "sha256-9xkldXV3UuaF5XhMyidLSN+ZCgjboiyy1PPA8E3sSnY=";
        };
        file = "Dracula.tmTheme";
      };
    };

    config = {
      theme = "Dracula";
    };
  };

  home.shellAliases = {
    cat = "bat --paging=never";
  };
}
