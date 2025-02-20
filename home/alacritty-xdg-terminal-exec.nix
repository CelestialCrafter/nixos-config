{ pkgs, ... }:

pkgs.writeShellScriptBin "xdg-terminal-exec" "exec ${pkgs.alacritty} -e \"$@\""
