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
      command_timeout = 2000;
    };
  };
}
