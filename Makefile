.PHONY: nix-install nix-upgrade clean-force clean update wsl

nix-install:
	bash ./scripts/install.sh

nix-upgrade:
	sudo -i nix upgrade-nix

clean-force:
	nix-collect-garbage -d
	nix-store --optimise

clean:
	nix-collect-garbage --delete-older-than 30d
	nix-store --optimise

update:
	nix-channel --update
	nix flake update

wsl:
	home-manager switch --flake .#wsl --show-trace --impure

mac:
	home-manager switch --flake .#mac --show-trace --impure