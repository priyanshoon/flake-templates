{
  description = "personal nix flake template for devenv";
  outputs =
    { self }:
    {
      templates = rec {
        c = {
          path = ./c;
          description = "C project environment";
        };
      };
    };
}
