{
  config,
  pkgs,
  ...
}: {
  config = {
    definitions = {
      rootDir = "${config.definitions.homeDirectory}/dev/system-manager";
      username = "grzelu";
      isNixos = true;
    };
  };
}
