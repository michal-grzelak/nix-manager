{ lib, ... }:
let
  print = val: builtins.trace (lib.generators.toPretty { } val);
in
{
  inherit print;
}
