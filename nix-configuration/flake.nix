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

      definitions = import ./definitions.nix { inherit lib; };
      utils = import ./utils.nix { inherit lib nixpkgs definitions; };
      common = {
        inherit definitions utils;
      };

      configureHome =
        { profile }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = utils.pkgsForCurrentSystem { };

          extraSpecialArgs = {
            common = (
              lib.attrsets.recursiveUpdate common {
                definitions = {
                  inherit profile;
                };
              }
            );
          };

          modules = [
            ./home.nix
            ./profiles/${profile}
          ];
        };
    in
    {
      homeConfigurations = {
        wsl = configureHome { profile = "wsl"; };
        mac = configureHome { profile = "mac"; };
      };
    };
}
