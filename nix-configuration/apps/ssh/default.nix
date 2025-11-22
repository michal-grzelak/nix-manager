{
  pkgs,
  lib,
  common,
  config,
  ...
}: let
  inherit (common) utils;
in {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = ["./ssh.config"];

    extraConfig = lib.mkMerge [
      (lib.mkIf (!config.definitions.isWsl && config.definitions.isLinux) ''
        Host *
            IdentityAgent ~/.1password/agent.sock
      '')
    ];

    matchBlocks = {
      "*" = {
        addKeysToAgent = "confirm";
      };
    };
  };

  home = {
    packages = with pkgs; [mosh];

    shellAliases = lib.mkMerge [
      (lib.mkIf (config.definitions.isWsl) {
        ssh = "ssh.exe";
        ssh-add = "ssh-add.exe";
      })
    ];
  };
}
