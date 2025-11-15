.PHONY: nix-install nix-upgrade clean-force clean nix-update wsl max

nix-install:
	bash ./nix-configuration/scripts/install.sh

nix-upgrade:
	sudo determinate-nixd upgrade

clean-force:
	nix-collect-garbage -d
	nix-store --optimise

clean:
	nix-collect-garbage --delete-older-than 30d
	nix-store --optimise

nix-update:
	nix flake update --flake ./nix-configuration

wsl:
	nix run github:nix-community/home-manager -- switch --flake ./nix-configuration#wsl --show-trace --impure

mac:
	nix run github:nix-community/home-manager -- switch --flake ./nix-configuration#mac --show-trace --impure