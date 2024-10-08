{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nil
    nixd
  ];
}
