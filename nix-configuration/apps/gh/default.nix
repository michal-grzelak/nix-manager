{
  config,
  pkgs,
  common,
  ...
}: let
  inherit (common) utils;
in {
  programs.gh = {
    enable = true;

    settings = {
      # Default git protocol
      git_protocol = "ssh";

      # Default editor
      editor = "code";

      # Default browser for web links
      browser = "default";

      # Enable aliases
      aliases = {
        co = "pr checkout";
        pv = "pr view";
        pc = "pr create";
        prw = "pr view --web";
      };

      # Default prompts behavior
      prompt = "enabled";

      # Default host
      host = "github.com";
    };
  };
}
