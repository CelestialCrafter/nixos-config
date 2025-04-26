{ pkgs, ... }:

{
  home.packages = with pkgs; [
    difftastic
    mergiraf
  ];

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        pager = "less -FRX";
        default-command = "log";
        diff = {
          tool = "difft";
          args = [
            "--color=always"
            "$left"
            "$right"
          ];
        };
      };

      merge-tools.mergiraf = {
        program = "mergiraf";
        merge-args = [
          "merge"
          "$base"
          "$left"
          "$right"
          "-o"
          "$output"
          "--fast"
        ];
        merge-conflict-exit-codes = [ 1 ];
        conflict-marker-style = "git";
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
