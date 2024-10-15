{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  imports = [ ./shells/${definitions.shellToUse}.nix ];

  programs.bat = {
    enable = true;

    extraPackages = with pkgs.bat-extras; [
      # display man with bat
      batman
    ];

    themes = {
      dracula = {
        src = pkgs.fetchFromGitHub {
          owner = "dracula";
          repo = "sublime"; # Bat uses sublime syntax for its themes
          rev = "v1.4.3";
          sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
        };
        file = "Dracula.tmTheme";
      };
    };

    config = {
      theme = "Dracula";
    };
  };

  home.shellAliases = {
    cat = "bat";
  };
}
