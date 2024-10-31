{
  pkgs,
  lib,
  definitions,
  utils,
  config,
  ...
}:
let
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
        source = config.lib.file.mkOutOfStoreSymlink "${definitions.rootDir}/apps/neovim/config";
      };
    };
  };
}
