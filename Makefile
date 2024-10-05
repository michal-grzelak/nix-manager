.PHONY: update
update:
	nix-channel --update
	nix flake update

.PHONY: wsl
wsl:
	home-manager switch --flake .#wsl --show-trace --impure