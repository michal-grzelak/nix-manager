{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.ssh = {
    enable = true;

    addKeysToAgent = "true";

    matchBlocks = {
      "mikrus-allure" = {
        hostname = "srv27.mikr.us";
        user = "grzekuu";
        port = 10294;

      };
    };
  };

  home = {
    packages = with pkgs; [ mosh ];

    shellAliases =
      if definitions.profile == "wsl" then
        {
          ssh = "ssh.exe";
          ssh-add = "ssh-add.exe";
        }
      else
        { };
  };
}
