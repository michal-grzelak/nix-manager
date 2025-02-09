{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.mise = {
    enable = true;
  };

  xdg = {
    configFile = {
      "mise/conf.d" = {
        source = "${definitions.rootDir}/apps/mise/config";

        # TODO: doesn't have access to system packages
        # onChange = ''
        #   ${pkgs.mise}/bin/mise i
        #   ${pkgs.mise}/bin/mise up
        # '';
      };
    };
  };
}
