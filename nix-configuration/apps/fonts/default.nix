{
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  fonts = {
    fontconfig.enable = true;
  };

  home = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.hack
      nerd-fonts.sauce-code-pro
      nerd-fonts.terminess-ttf
    ];
  };
}
