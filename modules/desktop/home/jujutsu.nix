{ pkgs, ... }:

{
  home.packages = [ pkgs.difftastic ];
  programs.jujutsu = {
    enable = true;

    settings = {
      working-copy.eol-conversion = "input";
      git.push-new-bookmarks = true;

      revset-aliases = {
        "closest_bookmark(to)" = "heads(::to & bookmarks())";
        "closest_pushable(to)" =
          "heads(::to & mutable() & ~description(exact:\"\") & (~empty() | merges()))";
      };
      aliases = {
        pull = [
          "git"
          "fetch"
        ];
        push = [
          "git"
          "push"
        ];
        tug = [
          "bookmark"
          "move"
          "--from"
          "closest_bookmark(@)"
          "--to"
          "closest_pushable(@)"
        ];
        top = [
          "util"
          "exec"
          "--"
          "sh"
          "-c"
          ''
            set -euo pipefail
            jj edit --color always 'heads(@::) & description(exact:"")' 2>&1 | grep -v "didn't resolve to any revisions" 1>&2 || \
            jj new --color always 'heads(@::)' 2>&1 | grep -v "Prefix the expression with \`all:\`" 1>&2
          ''
        ];
      };

      ui = {
        pager = "less -FRX";
        default-command = "log";
        diff-formatter = [
          "difft"
          "--color=always"
          "--display=inline"
          "$left"
          "$right"
        ];
      };

      templates.log = "builtin_log_compact ++ if(current_working_copy, diff.summary())";

      user = {
        name = "CelestialCrafter";
        email = "celestialcraftermc@gmail.com";
      };

      git.private-commits = "description(glob:'private:*')";

      revsets.log = "all()";
      revset-aliases."immutable_heads()" = "(trunk().. & ~mine())";

      signing = {
        behavior = "own";
        backend = "ssh";
        key = "~/.ssh/id_ed25519.pub";
      };
    };
  };
}
