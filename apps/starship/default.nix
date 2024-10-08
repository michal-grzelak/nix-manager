{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;

      character = {
        success_symbol = "[➜](bold green)";
      };
    };
  };
}
