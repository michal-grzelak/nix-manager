{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.zoxide = {
    enable = true;

    options = [
      "--cmd cd"
    ];
  };
}
