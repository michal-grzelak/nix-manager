{
  nixpkgs,
  lib,
  definitions,
  ...
}:
let
  # print any value pretty formatted
  print = val: builtins.trace (lib.generators.toPretty { } val);

  # import nixpkgs for given system
  pkgsForSystem = { system, ... }: import nixpkgs { inherit system; };

  # import nixpkgs for current system
  pkgsForCurrentSystem = { }: pkgsForSystem { inherit (definitions) system; };
in
{
  inherit print pkgsForSystem pkgsForCurrentSystem;
}
