.PHONY: nix-install
nix-install:
	bash ./scripts/install.sh

.PHONY: nix-upgrade
nix-upgrade:
	sudo -i nix upgrade-nix

.PHONY: clean-force
clean-force:
	nix-collect-garbage -d
	nix-store --optimise

.PHONY: clean
clean:
	nix-collect-garbage --delete-older-than 30d
	nix-store --optimise

.PHONY: update
update:
	nix-channel --update
	nix flake update
	make clean

.PHONY: wsl
wsl:
	home-manager switch --flake .#wsl --show-trace --impure