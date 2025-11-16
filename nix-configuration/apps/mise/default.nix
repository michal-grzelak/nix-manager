{
  pkgs,
  common,
  lib,
  ...
}: let
  inherit (common) utils;
in {
  programs.mise = {
    enable = true;
  };

  xdg = {
    configFile = {
      "mise/conf.d" = {
        source = ./config;

        # TODO: doesn't have access to system packages
        # onChange = ''
        #   ${pkgs.mise}/bin/mise i
        #   ${pkgs.mise}/bin/mise up
        # '';
      };
    };
  };
}
