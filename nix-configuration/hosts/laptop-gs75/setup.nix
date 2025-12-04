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
      homeStateVersion = "25.11";
      nixosStateVersion = "25.05";
    };
  };
}
