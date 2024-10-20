{
  definitions,
  utils,
  ...
}:
let
in
{
  programs.home-manager.enable = utils.print definitions true;

  home = {
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.05";

    username = definitions.username;
    homeDirectory = definitions.homeDirectory;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
      frequency = "weekly";
    };
  };

  systemd = {
    user = {
      enable = true;
    };
  };
}
