builtins.listToAttrs
  (builtins.map
    (name: {
        inherit name;
        value = import (./. + ("/" + name));
      }
    )
    (builtins.fromJSON (builtins.readFile ./packages.json))
  )
