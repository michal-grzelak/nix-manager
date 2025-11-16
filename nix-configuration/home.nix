{
  lib,
  common,
  config,
  profile,
  ...
}:
let
  inherit (common) utils constants;
in
{
  config = {
    programs.home-manager.enable = utils.print config.definitions true;

    definitions = {
      rootDir = "${config.definitions.homeDirectory}/nix-manager";
      username = "grzekuu";
      profile = profile;
      isWsl = true;
    };

    home = {
      # You can update Home Manager without changing this value. See
      # the Home Manager release notes for a list of state version
      # changes in each release.
      stateVersion = "25.11";

      username = config.definitions.username;
      homeDirectory = config.definitions.homeDirectory;
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
      // lib.attrsets.optionalAttrs (config.definitions.isLinux == true) {
        user = {
          enable = true;
        };
      };

    xdg = {
      enable = true;
    };
  };

}
