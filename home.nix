{
  lib,
  pkgs,
  username,
  homeDirectory,
  ...
}:
{
  programs.home-manager.enable = true;

  home = {
    username = username;
    homeDirectory = homeDirectory;

    packages = with pkgs; [
      nixfmt-rfc-style
    ];

    stateVersion = "24.05";
  };
}
