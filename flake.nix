{
  description = "personal nix flake template for devenv";
  outputs =
    { self }:
    {
      templates = {
        c = {
          path = ./c;
          description = "C project environment";
        };
      };
    };
}
