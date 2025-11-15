{
  lib,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.home-manager.enable = utils.print definitions true;

  home = {
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.11";

    username = definitions.username;
    homeDirectory = definitions.homeDirectory;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
      dates = "weekly";
    };
  };

  systemd =
    { }
    // lib.attrsets.optionalAttrs (definitions.isLinux == true) {
      user = {
        enable = true;
      };
    };

  xdg = {
    enable = true;
  };
}
