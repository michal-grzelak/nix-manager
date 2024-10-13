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
    # formatter
    nixfmt-rfc-style

    # language servers
    nil
    nixd
  ];
}
