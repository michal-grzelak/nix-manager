{
  nixpkgs,
  lib,
  ...
}:
let
  # print any value pretty formatted
  print = val: builtins.trace (lib.generators.toPretty { } val);

  # import nixpkgs for given system
  pkgsForSystem =
    { system, ... }:
    import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
in
{
  inherit print pkgsForSystem;
}
