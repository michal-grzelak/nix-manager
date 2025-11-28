.PHONY: nix-install nix-upgrade clean-force clean nix-update pc-windows mac laptop-gs75

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

pc-windows:
	nix run github:nix-community/home-manager -- switch --flake ./nix-configuration#pc-windows --show-trace --impure

mac:
	nix run github:nix-community/home-manager -- switch --flake ./nix-configuration#mac --show-trace --impure

laptop-gs75:
	sudo nixos-rebuild switch --flake ./nix-configuration#laptop-gs75 --show-trace --impure

ardent-w11:
	nix run github:nix-community/home-manager -- switch --flake ./nix-configuration#ardent-w11 --show-trace --impure