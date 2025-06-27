{ pkgs, ... }:

{
  home.packages = [ pkgs.difftastic ];
  programs.jujutsu = {
    enable = true;

    settings = {
      aliases = {
        "m" = "jj bookmark move --from 'heads(::@- & bookmarks())' --to @-";
        "c" = "jj commit";
      };

      ui = {
        show-cryptographic-signatures = true;
        default-command = "log";
        diff-formatter = ["difft" "--color=always" "--display=inline" "$left" "$right"];
      };

      user = {
        name = "CelestialCrafter";
        email = "celestialcraftermc@gmail.com";
      };

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
