{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.bat = {
    enable = true;

    extraPackages = with pkgs.bat-extras; [
      # display man with bat
      batman
    ];
  };

  home.shellAliases = {
    cat = "bat";
  };
}
