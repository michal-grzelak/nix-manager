{
  pkgs,
  definitions,
  utils,
  ...
}:
let
in
{
  programs.fzf = {
    enable = true;

    defaultOptions = [
      "--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229"
      "--color info:150,prompt:110,spinner:150,pointer:167,marker:174"
    ];

    tmux = {
      enableShellIntegration = true;
    };
  };
}
