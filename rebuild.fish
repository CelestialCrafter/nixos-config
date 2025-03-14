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
	echo "--system or $hostname must be set"
	return
end

# building
set -l tmp (mktemp -t -d nixos-custom-rebuild.XXXXXX)
set -l output "$tmp/result"

nix build ".#nixosConfigurations.$system.config.system.build.toplevel" --out-link $output
and $output/bin/switch-to-configuration $action

# cleanup
rm -rf $tmp
