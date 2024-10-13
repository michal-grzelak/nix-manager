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
    ../../apps/fonts
    ../../apps/shells
    ../../apps/starship
    ../../apps/mise
  ];
}
