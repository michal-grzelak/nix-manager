{
  pkgs,
  lib,
  common,
  config,
  ...
}: let
  inherit (common) utils;
in {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg = {
    configFile = {
      "nvim" = {
        source = ./config;
        recursive = true;
      };
    };
  };
}
