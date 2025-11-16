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
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;

      constants = import ./constants.nix { inherit lib; };
      utils = import ./utils.nix { inherit lib nixpkgs; };
      common = {
        inherit utils constants;
      };

      configureHome =
        { profile, system }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = utils.pkgsForSystem { inherit system; };

          extraSpecialArgs = {
            inherit
              inputs
              outputs
              system
              profile
              common
              ;
          };

          modules = [
            ./definitions.nix
            ./home.nix
            ./profiles/${profile}
          ];
        };
    in
    {
      homeConfigurations = {
        wsl = configureHome {
          profile = "wsl";
          system = constants.systems.linuxPc;
        };
        mac = configureHome {
          profile = "mac";
          system = constants.systems.macArm;
        };
      };
    };
}
