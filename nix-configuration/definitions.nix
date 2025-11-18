{
  lib,
  config,
  system,
  common,
  ...
}: let
  cfg = config.definitions;
  inherit (common) constants;
in
  assert lib.asserts.assertOneOf "system" system constants.supportedSystems; {
    options = {
      definitions = {
        isArm = lib.mkEnableOption "isArm";

        isPc = lib.mkEnableOption "isPc";

        isLinux = lib.mkEnableOption "isLinux";

        isMac = lib.mkEnableOption "isMac";

        isWsl = lib.mkEnableOption "isWsl";

        system = lib.mkOption {
          type = lib.types.enum constants.supportedSystems;
          description = "Host system identifier.";
        };

        shellToUse = lib.mkOption {
          type = lib.types.enum [
            "fish"
            "zsh"
            "bash"
          ];
          default = "fish";
          description = "Preferred interactive shell to be used across configs (e.g., fish, zsh, bash).";
        };

        username = lib.mkOption {
          type = lib.types.str;
          description = "Username for the system.";
        };

        homeDirectory = lib.mkOption {
          type = lib.types.str;
          default = "/home/${config.definitions.username}";
          description = "Home directory of the user.";
        };

        rootDir = lib.mkOption {
          type = lib.types.str;
          description = "Root directory of the system configuration.";
        };

        nixConfigDir = lib.mkOption {
          type = lib.types.str;
          default = "${config.definitions.rootDir}/nix-configuration";
          description = "Path to the nix configuration directory.";
        };

        stateVersion = lib.mkOption {
          type = lib.types.str;
          description = "Home Manager state version.";
        };
      };
    };

    config = {
      definitions = {
        isArm = builtins.elem system [
          constants.systems.linuxArm
          constants.systems.macArm
        ];

        isPc = builtins.elem system [
          constants.systems.linuxPc
          constants.systems.macPc
        ];

        isLinux = builtins.elem system [
          constants.systems.linuxArm
          constants.systems.linuxPc
        ];

        isMac = builtins.elem system [
          constants.systems.macArm
          constants.systems.macPc
        ];

        system = system;

        stateVersion = "25.05";
      };
    };
  }
