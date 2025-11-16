{
  pkgs,
  common,
  lib,
  config,
  ...
}:
let
  inherit (common) utils;
in
{

  programs.git = {
    enable = true;

    # set user in local .gitconfig

    # set the rest in local .gitignore
    ignores = [
      "**/.vscode/.history"
    ];

    settings = {
      core = lib.mkMerge [
        {
          editor = "code -n --wait";
          excludesFile = "~/.gitignore";
          whitespace = "-trailing-space";
        }
        (lib.mkIf (config.definitions.isWsl) { sshCommand = "ssh.exe"; })
      ];
      push = {
        default = "simple";
        followTags = true;
      };
      pull = {
        rebase = "merges";
      };
      merge = {
        tool = "code";
        autoStash = true;
        conflictstyle = "diff3";
      };
      rebase = {
        autoStash = true;
      };
      diff = {
        tool = "delta";
        colorMoved = "default";
      };
      difftool = {
        prompt = false;
        code = {
          cmd = "code -n --wait --diff $LOCAL $REMOTE";
        };
      };
      mergetool = {
        trustExitCode = true;
        keepBackup = false;
        code = {
          cmd = "code -n --wait --merge $LOCAL $REMOTE $BASE $MERGED";
        };
      };
      filter = {
        lfs = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
      };
      pack = {
        threads = 4;
      };
      fetch = {
        prune = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      gpg = {
        format = "ssh";
      };
      color = {
        ui = "auto";
      };

      alias = {
        # Keep original date after rebase
        rebase-date = "rebase --committer-date-is-author-date";

        # Commit
        c = "commit";

        # Commit
        cm = "commit -m";

        # prune non-existing branches
        prune = "fetch --prune --progress -v";

        # list unused branches
        ubranch = "branch --list --format '%(if:equals=[gone])%(upstream:track)%(then)%(refname)%(end)'";

        # git push without overwriting someone's changes
        push-lease = "push --force-with-lease";

        # Safer pulls; don't do anything other than a fast forward on merge
        pull = "pull --ff-only";

        # Remove file(s) from Git but not from disk
        untrack = "rm --cache --";

        # Continue rebase
        crebase = "rebase --continue";

        # Abort rebase
        arebase = "rebase --abort";

        # Continue merge
        cmerge = "merge --continue";

        # Checkout
        co = "checkout";

        # List tags with all messages
        tags = "tag -n99";
      };
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        showFileIcons = true;
        nerdFontsVersion = "3";
        windowSize = "half";
      };
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --paging=never --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
        };
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
      hyperlinks = true;
    };
  };
}
