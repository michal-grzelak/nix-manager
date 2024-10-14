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
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Hack"
          "SourceCodePro"
          "Terminus"
        ];
      })
    ];
  };
}
