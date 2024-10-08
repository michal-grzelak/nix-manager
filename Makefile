.PHONY: clean-force
clean-force:
	nix-collect-garbage -d

.PHONY: clean
clean:
	nix-collect-garbage --delete-older-than 30d

.PHONY: update
update:
	nix-channel --update
	nix flake update
	make clean

.PHONY: wsl
wsl:
	home-manager switch --flake .#wsl --show-trace --impure