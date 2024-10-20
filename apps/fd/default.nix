{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.fd = {
    enable = true;

    hidden = true;
  };
}
