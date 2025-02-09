{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.nnn = {
    enable = true;

    package = pkgs.nnn.override ({ withNerdIcons = true; });

    plugins = {
      src =
        (pkgs.fetchFromGitHub {
          owner = "jarun";
          repo = "nnn";
          rev = "v5.0";
          sha256 = "sha256-HShHSjqD0zeE1/St1Y2dUeHfac6HQnPFfjmFvSuEXUA=";
        })
        + "/plugins";
    };
  };

  home.shellAliases = {
    nnn = "nnn -c";
  };
}
