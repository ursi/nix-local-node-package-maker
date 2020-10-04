with (import <nixos> {});
let
  local = import ./.;
in
  mkShell {
    buildInputs = [
      nodejs
      local.npm-add-dependencies
    ];

    shellHook = builtins.readFile ./shellHook.sh;
  }
