{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  imports = [
    ../../apps/dev-libs
    ../../apps/git
    ../../apps/mise
    ../../apps/neovim
  ];
}
