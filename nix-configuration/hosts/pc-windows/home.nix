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
      homeStateVersion = "25.11";
    };
  };

  imports = [../../profiles/wsl];
}
