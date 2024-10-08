{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.mise = {
    enable = true;

    settings = {
      always_keep_download = false;
      always_keep_install = false;
    };
  };
}
