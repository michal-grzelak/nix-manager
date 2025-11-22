{
  lib,
  common,
  config,
  osConfig,
  ...
}: let
  inherit (common) utils constants;
in {
  config.definitions = osConfig.definitions;

  imports = [
    ../../profiles/common
  ];
}
