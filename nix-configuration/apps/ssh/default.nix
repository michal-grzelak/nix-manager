{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.ssh = {
    enable = true;

    addKeysToAgent = "true";

    includes = [ "./ssh.config" ];
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
