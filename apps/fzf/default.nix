{
  pkgs,
  common,
  ...
}:
let
  inherit (common) definitions utils;
in
{
  programs.fzf = {
    enable = true;

    defaultOptions = [
      "--color=dark"
      "--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f"
      "--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7"
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];

    tmux = {
      enableShellIntegration = true;
    };
  };
}
