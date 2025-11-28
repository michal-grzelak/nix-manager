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
      rootDir = "${config.definitions.homeDirectory}/dev/nix-manager";
      username = "grzelu";
      isWsl = true;
    };
  };

  imports = [../../profiles/wsl];
}
