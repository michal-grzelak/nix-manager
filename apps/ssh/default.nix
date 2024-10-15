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

    includes = [ "./config.local" ];
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
