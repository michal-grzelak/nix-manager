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

      username = builtins.getEnv "USER";
      homeDirectory = "/home/${username}";

      configData = {
        inherit username homeDirectory;
      };
    in
    {
      homeConfigurations = {
        wsl = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem {
            system = "x86_64-linux";
          };

          extraSpecialArgs = (
            configData
            # other args go here
            // {
            }
          );

          modules = [
            ./home.nix
          ];
        };
      };
    };
}
