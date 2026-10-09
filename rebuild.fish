#!/usr/bin/env fish

# args
argparse 's/system=?' -- $argv
or return

if test $EUID -ne 0
    echo "script must be running as root"
    return
end

if set -q _flag_system
    set system $_flag_system
else if set -q hostname
    set system $hostname
else
    echo "--system or $hostname must be set" 1>&2
    return
end

if test (math (date +%s) - (stat --format %Y flake.lock)) -gt (math "7 * 24 * 60 * 60")
    echo "warning: flake.lock is over 1 week old. please run `nix flake update` (if you want to)" 1>&2
end

# building
set -l tmp (mktemp -d -t nixos-custom-rebuild.XXXXXX)
set -l output "$tmp/result"

nix build ".#nixosConfigurations.$system.config.system.build.toplevel" --out-link $output --extra-experimental-features nix-command --extra-experimental-features flakes
and nix-env --profile /nix/var/nix/profiles/system --set (readlink -f $output)
and /nix/var/nix/profiles/system/bin/switch-to-configuration switch

# cleanup
rm -rf $tmp
