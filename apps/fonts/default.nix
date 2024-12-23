{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
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
