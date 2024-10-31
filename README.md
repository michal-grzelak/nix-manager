# Description

Environment and home setup using Nix.

## Structure

- `flake.nix` - main entrypoint; base setup of Nix and home-manager profiles; profiles source `profiles/<profile>` dirs
- `home.nix` - minimal shared setup of home-manager
- `definitions.nix` - configuration of global variables defining the system
- `utils.nix` - global functions for common usage
- `profile/<profile>` - directory for profiles; presets are imported here
- `presets/<preset>` - directory for presets; packages, apps and common configuration for preset are imported here
- `apps/<app>` - directory for apps; individual packages/apps are imported and configured here (especially for apps that would require bigger configuration)
