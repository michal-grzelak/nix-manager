{
  lib,
  common,
  config,
  ...
}: let
  inherit (common) utils constants;
in {
  config = {
    definitions = {
      rootDir = "${config.definitions.homeDirectory}/dev/system-manager";
      username = "grzekuu";
      isWsl = true;
    };
  };

  imports = [../../profiles/wsl];
}
