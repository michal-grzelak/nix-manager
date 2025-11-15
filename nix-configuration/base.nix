{ lib, ... }:
let

in

{
  # Module options derived from definitions.nix
  options = {
    definitions = {
      # username = lib.mkOption {
      #   type = lib.types.str;
      #   description = "Username for the system.";
      # };

      # system = lib.mkOption {
      #   type = lib.types.str;
      #   description = "Current system identifier (builtins.currentSystem).";
      # };

      isArm = lib.mkEnableOption "isArm";

      isPc = lib.mkEnableOption "isPc";

      isLinux = lib.mkEnableOption "isLinux";

      isMac = lib.mkEnableOption "isMac";

      shellToUse = lib.mkOption {
        type = lib.types.enum [
          "fish"
          "zsh"
          "bash"
        ];
        default = "fish";
        description = "Preferred interactive shell to be used across configs (e.g., fish, zsh, bash).";
      };
    };
  };
}
