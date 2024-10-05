{
  description = "My environment configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;

      pkgsForSystem = { system, ... }: import nixpkgs { inherit system; };

      utils = import ./utils.nix { inherit lib; };
      definitions = import ./definitions.nix { inherit lib; };
      common = {
        inherit definitions utils;
      };
    in
    {
      homeConfigurations = {
        wsl = home-manager.lib.homeManagerConfiguration {

          pkgs = pkgsForSystem {
            inherit (definitions) system;
          };

          extraSpecialArgs = (
            lib.attrsets.recursiveUpdate common {
              definitions = {
                profile = "wsl";
              };
            }
          );

          modules = [
            ./home.nix
            ./profiles/wsl
          ];
        };
      };
    };
}
