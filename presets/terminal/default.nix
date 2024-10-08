{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
# data to initialize target shell; returns { interactive; login; }
# shellInitData = import ../../apps/shells/${definitions.shellToUse}/initialize.nix {
#   inherit pkgs definitions utils;
# };
{
  imports = [
    ../../apps/nix-lib
    ../../apps/fonts
    ../../apps/shells/${definitions.shellToUse}
    ../../apps/starship
    ../../apps/mise
  ];

  # shells installed by nix must be initialized by default shell on the system
  # programs.bash = {
  #   enable = true;
  #   initExtra = shellInitData.interactive;
  #   bashrcExtra = shellInitData.login;
  # };
}
