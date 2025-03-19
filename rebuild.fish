#!/usr/bin/env fish

# args
argparse a/action=? s/system=? -- $argv
or return

if set -q _flag_action
	set action _flag_action
else
	set action switch
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
set -l tmp (mktemp -t -d nixos-custom-rebuild.XXXXXX)
set -l output "$tmp/result"

nix build ".#nixosConfigurations.$system.config.system.build.toplevel" --out-link $output
and $output/bin/switch-to-configuration $action

# cleanup
rm -rf $tmp
