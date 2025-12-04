{
  lib,
  common,
  config,
  inputs,
  ...
}: let
  inherit (common) utils;

  flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  programs.home-manager.enable = utils.print config.definitions true;

  home = {
    stateVersion = config.definitions.homeStateVersion;

    username = config.definitions.username;
    homeDirectory = config.definitions.homeDirectory;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
      dates = "weekly";
    };

    # Add each flake input as a registry and nix_path
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  systemd = lib.mkMerge [
    (lib.mkIf (config.definitions.isLinux == true) {
      user = {
        enable = true;
      };
    })
  ];

  xdg = {
    enable = true;
  };
}
