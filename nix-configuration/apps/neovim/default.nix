{
  pkgs,
  lib,
  common,
  config,
  ...
}:
let
  inherit (common) definitions utils;
in
{
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
