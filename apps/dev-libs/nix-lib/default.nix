{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  home.packages = with pkgs; [
    # formatter
    nixfmt-rfc-style

    # language servers
    nil
    nixd
  ];
}
